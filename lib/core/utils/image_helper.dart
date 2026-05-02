import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

/// Helper to resolve image providers correctly regardless of whether the image
/// is stored as a base64 string or an HTTP URL.
class ImageHelper {
  /// Returns an appropriate [ImageProvider] for the given [source].
  ///
  /// If the source starts with 'http' or 'https', it returns a [NetworkImage].
  /// If it is a base64 string, it decodes it and returns a [MemoryImage].
  /// If decoding fails or the string is empty, returns null.
  static ImageProvider? getImageProvider(String? source) {
    if (source == null || source.trim().isEmpty) return null;

    final trimmed = source.trim();

    if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
      return NetworkImage(trimmed);
    }

    try {
      // Sometimes base64 strings come with data URI prefix, like "data:image/jpeg;base64,..."
      String base64String = trimmed;
      if (trimmed.startsWith('data:image')) {
        final commaIndex = trimmed.indexOf(',');
        if (commaIndex != -1) {
          base64String = trimmed.substring(commaIndex + 1);
        }
      }

      // Remove any line breaks or whitespace that might corrupt base64
      base64String = base64String.replaceAll(RegExp(r'\s+'), '');

      Uint8List bytes = base64Decode(base64String);
      return MemoryImage(bytes);
    } catch (e) {
      debugPrint('Error decoding base64 image: $e');
      return null;
    }
  }
}
