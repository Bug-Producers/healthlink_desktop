import 'package:flutter/material.dart';
import '../../../../core/app_bar_widget.dart';
import '../widget/appointments_header.dart';
import '../widget/appointments_list.dart';

/// The primary screen for managing medical appointments.
///
/// This widget provides a responsive layout incorporating the global [AppBarWidget],
/// the [AppointmentsHeaderWidget] for context, and the [AppointmentsListWidget] 
/// for displaying a detailed table of patient appointments.
///
/// @param key The widget key.
class AppointmentScreen extends StatelessWidget {
  /// Constructs the [AppointmentScreen].
  const AppointmentScreen({super.key});

  /// Builds the fully responsive appointment layout.
  ///
  /// Adjusts horizontal padding and vertical spacing based on the
  /// available screen width using a [LayoutBuilder].
  ///
  /// @param context The build context.
  /// @return A constrained, scrollable screen.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf7f9fb),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final paddingValue = constraints.maxWidth < 800 ? 16.0 : 40.0;
          final headerSpacing = constraints.maxWidth < 800 ? 24.0 : 45.0;
          final bodySpacing = constraints.maxWidth < 800 ? 16.0 : 31.0;

          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1440),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBarWidget(),
                    SizedBox(height: headerSpacing),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: paddingValue),
                      child: const AppointmentsHeaderWidget(),
                    ),
                    SizedBox(height: bodySpacing),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: paddingValue),
                      child: const AppointmentsListWidget(),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
