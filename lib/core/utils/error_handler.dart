import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// The [ErrorHandler] provides centralized logic for intercepting and 
/// interpreting errors across the application.
///
/// It translates technical exceptions from the network layer (Dio) or 
/// authentication provider (Firebase) into clear, actionable guidance 
/// for the end user.
class ErrorHandler {
  /// Transforms an raw error object into a user-facing string.
  /// Handles [DioException], Firebase strings, and generic objects.
  static String getMessage(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    }
    if (error is String) {
      return error;
    }
    final msg = error.toString();
    
    // Pattern matching for Firebase Authentication error codes.
    if (msg.contains('user-not-found')) {
      return 'No account found with this email address.';
    }
    if (msg.contains('wrong-password') || msg.contains('invalid-credential')) {
      return 'Incorrect email or password. Please try again.';
    }
    if (msg.contains('email-already-in-use')) {
      return 'An account with this email already exists.';
    }
    if (msg.contains('weak-password')) {
      return 'Password is too weak. Use at least 6 characters.';
    }
    if (msg.contains('invalid-email')) {
      return 'Please enter a valid email address.';
    }
    if (msg.contains('too-many-requests')) {
      return 'Too many attempts. Please wait a moment and try again.';
    }
    if (msg.contains('network-request-failed')) {
      return 'Network error. Check your internet connection.';
    }
    if (msg.contains('PERMISSION_DENIED') || msg.contains('permission-denied')) {
      return 'Permission denied. Contact your administrator.';
    }
    
    return 'An unexpected error occurred: $msg';
  }

  /// Categorizes and translates Dio-specific network failures.
  static String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timed out. The server may be unavailable.';
      case DioExceptionType.connectionError:
        return 'Cannot connect to the server.\nPlease ensure the API is running at the configured address.';
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;
        String serverMsg = '';
        
        // Attempt to extract structured error messages from the backend response.
        if (data is Map && data.containsKey('message')) {
          serverMsg = data['message'].toString();
        } else if (data is Map && data.containsKey('error')) {
          serverMsg = data['error'].toString();
        }
        
        switch (statusCode) {
          case 400:
            return serverMsg.isNotEmpty
                ? serverMsg
                : 'Invalid request. Please check your input.';
          case 401:
            return 'Authentication failed. Please log in again.';
          case 403:
            return 'You do not have permission to perform this action.';
          case 404:
            return serverMsg.isNotEmpty
                ? serverMsg
                : 'The requested resource was not found.';
          case 409:
            return serverMsg.isNotEmpty
                ? serverMsg
                : 'A conflict occurred. The resource may already exist.';
          case 500:
            return 'Internal server error. Please try again later.';
          default:
            return serverMsg.isNotEmpty
                ? serverMsg
                : 'Server error ($statusCode). Please try again.';
        }
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      default:
        return 'Cannot connect to the server.\nPlease ensure the API is running.';
    }
  }

  /// Displays an error alert as a floating SnackBar with a red theme.
  static void showError(BuildContext context, dynamic error) {
    final message = getMessage(error);
    if (!context.mounted) return;
    
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.error_outline, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Something went wrong',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    message,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFD32F2F),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'DISMISS',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  /// Displays a success confirmation as a floating SnackBar with a green theme.
  static void showSuccess(BuildContext context, String message) {
    if (!context.mounted) return;
    
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF006D60),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// Displays a warning or informational message with an amber theme.
  static void showWarning(BuildContext context, String message) {
    if (!context.mounted) return;
    
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.warning_amber_outlined, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFE65100),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
