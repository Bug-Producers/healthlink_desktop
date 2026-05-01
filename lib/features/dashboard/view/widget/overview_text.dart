import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// [OverViewText] provides the primary heading for the dashboard.
///
/// It displays a welcoming "Overview" title alongside the current 
/// formatted date (e.g., "Monday, May 1").
class OverViewText extends StatelessWidget {
  /// Constructs an [OverViewText] widget.
  /// 
  /// @param key The widget key.
  const OverViewText({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formatted = DateFormat('EEEE, MMM d').format(now);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Overview",
          style: TextStyle(
            color: Colors.black,
            fontSize: 36,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          formatted,
          style: const TextStyle(
            color: Color(0XFF3d4947),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}