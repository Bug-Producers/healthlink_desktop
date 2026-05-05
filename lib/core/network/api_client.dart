import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client.g.dart';

/// Configures and provides the singleton [Dio] instance for API communication.
///
/// This client automatically injects the Firebase ID token into the 
/// 'Authorization' header of every request if a user is authenticated.
/// 
/// @param ref The Riverpod [Ref].
/// @return A configured [Dio] instance with base URL and auth interceptors.
/// Recursively decodes a value that may be stringified JSON at any depth.
/// Returns the fully decoded structure (Map, List, or primitive).
dynamic _deepDecode(dynamic value) {
  if (value is String) {
    final trimmed = value.trim();
    // Only attempt to decode strings that look like JSON objects or arrays.
    // This prevents turning string IDs like "123" into integers!
    if (trimmed.startsWith('{') || trimmed.startsWith('[')) {
      try {
        final decoded = jsonDecode(trimmed);
        return _deepDecode(decoded); // recurse in case of double-encoding
      } catch (_) {
        return value; // genuinely a plain string that happens to start with { or [
      }
    }
    return value;
  }
  if (value is Map) {
    return value.map((k, v) => MapEntry(k.toString(), _deepDecode(v)));
  }
  if (value is List) {
    return value.map((e) => _deepDecode(e)).toList();
  }
  return value;
}

@riverpod
Dio apiClient(Ref ref) {
  final dio = Dio(BaseOptions(
    baseUrl: dotenv.env['API_BASE_URL'] ?? 'https://healthlink-api.loca.lt/',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    responseType: ResponseType.plain, // Force ALL responses to be raw strings
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final token = await user.getIdToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Since responseType is plain, response.data is always a String.
        print('API RESPONSE [${response.requestOptions.path}]: ${response.data}');
        // Deeply decode it so all downstream code gets native Dart types.
        response.data = _deepDecode(response.data);
        return handler.next(response);
      },
    ),
  );

  return dio;
}
