import 'package:flutter/material.dart';

class AppointmentsHeaderWidget extends StatelessWidget {
  const AppointmentsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Appointments",
          style: TextStyle(
            color: Colors.black,
            fontSize: 36,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Manage your schedule and patient visits.",
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
