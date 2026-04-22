import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/app_bar_widget.dart';
import '../widget/schedule_header.dart';
import '../widget/weekly_availability.dart';
import '../widget/consultation_parameters.dart';

class MyScheduleScreen extends StatelessWidget {
  const MyScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf7f9fb),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 800;
          final paddingValue = constraints.maxWidth < 800 ? 16.0 : 40.0;
          final headerSpacing = constraints.maxWidth < 800 ? 24.0 : 45.0;
          final bodySpacing = constraints.maxWidth < 800 ? 16.0 : 31.0;

          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1440),
                child: Column(
                  children: [
                    const AppBarWidget(),
                    SizedBox(height: headerSpacing),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: paddingValue),
                      child: const ScheduleHeaderWidget(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: paddingValue),
                      child: Column(
                        children: [
                          SizedBox(height: bodySpacing),
                          
                          ResponsiveRowColumn(
                            layout: isDesktop ? ResponsiveRowColumnType.ROW : ResponsiveRowColumnType.COLUMN,
                            rowCrossAxisAlignment: CrossAxisAlignment.start,
                            rowSpacing: 30,
                            columnSpacing: 20,
                            children: const [
                              ResponsiveRowColumnItem(
                                rowFlex: 6, // 60% of the width
                                child: WeeklyAvailabilityWidget(),
                              ),
                              ResponsiveRowColumnItem(
                                rowFlex: 4, // 40% of the width
                                child: ConsultationParametersWidget(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
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
