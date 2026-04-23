import 'package:flutter/material.dart';
import '../../../../core/app_bar_widget.dart';
import '../widget/appointments_header.dart';
import '../widget/appointments_list.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

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
