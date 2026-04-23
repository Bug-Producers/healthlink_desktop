import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F4F5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.health_and_safety,
            color: Color(0xFF006D60),
            size: 32,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          "HealthLink",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "CLINICAL ATELIER",
          style: TextStyle(
            color: Color(0XFF5a6362),
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.0,
          ),
        ),
      ],
    );
  }
}
