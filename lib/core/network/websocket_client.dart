import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'websocket_client.g.dart';

/// A robust WebSocket client that connects, authenticates, and provides
/// a stream of incoming notifications.
class WebSocketClient {
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  
  final _notificationController = StreamController<String>.broadcast();
  Stream<String> get notifications => _notificationController.stream;

  bool _isConnected = false;

  void connect() async {
    if (_isConnected) return;

    final wsUrl = dotenv.env['WS_BASE_URL'] ?? 'ws://localhost:3000';
    final url = Uri.parse('$wsUrl/api/ws/notifications');

    try {
      _channel = WebSocketChannel.connect(url);
      _isConnected = true;

      // 1. Authenticate immediately after connecting
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final token = await user.getIdToken();
        if (token != null) {
          _channel?.sink.add('Bearer $token');
        }
      }

      // 2. Listen for messages
      _subscription = _channel?.stream.listen(
        (message) {
          if (message == 'AUTHENTICATED') {
            // Logged in via WS successfully.
            return;
          }
          // Broadcast all other messages as notifications
          _notificationController.add(message.toString());
        },
        onDone: () {
          _isConnected = false;
          _reconnect();
        },
        onError: (error) {
          _isConnected = false;
          _reconnect();
        },
      );
    } catch (e) {
      _isConnected = false;
      _reconnect();
    }
  }

  void _reconnect() {
    Future.delayed(const Duration(seconds: 5), () {
      connect();
    });
  }

  void disconnect() {
    _isConnected = false;
    _subscription?.cancel();
    _channel?.sink.close();
  }
}

@Riverpod(keepAlive: true)
WebSocketClient webSocketClient(Ref ref) {
  final client = WebSocketClient();
  
  // Connect immediately upon provider initialization
  client.connect();

  ref.onDispose(() {
    client.disconnect();
  });

  return client;
}
