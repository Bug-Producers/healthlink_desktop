import 'package:flutter/material.dart';

/// [FinancialsHeaderWidget] provides the contextual title and descriptive 
/// summary for the Financial Hub screen.
class FinancialsHeaderWidget extends StatelessWidget {
  /// Constructs a [FinancialsHeaderWidget].
  /// 
  /// @param key The widget key.
  const FinancialsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Financial Hub",
          style: TextStyle(
            color: Colors.black,
            fontSize: 36,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Curated overview of clinical revenue and active transactions.",
          style: TextStyle(
            color: Color(0XFF5a6362),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
