import 'package:flutter/material.dart';

/// Displays the title and subtitle for the Appointments screen.
///
/// A simple stateless widget that provides clear context ("Appointments" and
/// "Manage your schedule and patient visits.") at the top of the view.
///
/// @param key The widget key.
class AppointmentsHeaderWidget extends StatelessWidget {
  /// Constructs the [AppointmentsHeaderWidget].
  const AppointmentsHeaderWidget({super.key});

  /// Builds the column containing the title and subtitle texts.
  ///
  /// @param context The build context.
  /// @return A column of styled text widgets.
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
