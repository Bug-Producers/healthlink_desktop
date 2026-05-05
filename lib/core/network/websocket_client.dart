import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'websocket_client.g.dart';

/// The [WebSocketClient] manages real-time communication with the backend.
///
/// It handles persistent connection establishment, token-based authentication 
/// over the socket, and provides a broadcast stream for incoming notifications.
class WebSocketClient {
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  
  final _notificationController = StreamController<String>.broadcast();

  /// A broadcast stream of incoming system notification messages.
  /// 
  /// @return A [Stream] of notification strings.
  Stream<String> get notifications => _notificationController.stream;

  bool _isConnected = false;
  bool _isIntentionalDisconnect = false;

  /// Establishes a connection to the WebSocket server and performs authentication.
  /// 
  /// @return A [Future] that completes when the connection attempt finishes.
  void connect() async {
    if (_isConnected) return;
    _isIntentionalDisconnect = false;

    final wsUrl = dotenv.env['WS_BASE_URL'] ?? 'wss://healthlink-api.loca.lt/';
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

  /// Attempts to reconnect to the server after a delay.
  void _reconnect() {
    if (_isIntentionalDisconnect) return;
    
    Future.delayed(const Duration(seconds: 5), () {
      connect();
    });
  }

  /// Terminates the current WebSocket session and cleans up resources.
  ///
  /// Sends a proper close frame (code 1000) to avoid abnormal closure (1006).
  void disconnect() {
    _isIntentionalDisconnect = true;
    _isConnected = false;
    _subscription?.cancel();
    _channel?.sink.close(1000, 'Client disconnecting');
  }
}

/// Singleton provider for the [WebSocketClient].
/// 
/// @param ref The Riverpod [Ref].
/// @return A configured and connected [WebSocketClient] instance.
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
