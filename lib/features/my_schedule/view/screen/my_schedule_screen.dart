import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/app_bar_widget.dart';
import '../widget/schedule_header.dart';
import '../widget/weekly_availability.dart';
import '../widget/consultation_parameters.dart';

/// [MyScheduleScreen] is the administrative interface for managing clinical hours.
///
/// It allows doctors to define their weekly availability and configure 
/// consultation parameters like session duration and buffer times. 
///
/// It utilizes [GlobalKey]s to bridge the [ScheduleHeaderWidget] actions 
/// with the child state management of the availability and parameter forms.
class MyScheduleScreen extends StatefulWidget {
  /// Constructs a [MyScheduleScreen].
  /// 
  /// @param key The widget key.
  const MyScheduleScreen({super.key});

  @override
  State<MyScheduleScreen> createState() => _MyScheduleScreenState();
}

class _MyScheduleScreenState extends State<MyScheduleScreen> {
  /// Reference to the [WeeklyAvailabilityWidget] state for bulk saving.
  final _weeklyKey = GlobalKey();
  
  /// Reference to the [ConsultationParametersWidget] state for bulk saving.
  final _consultationKey = GlobalKey();

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
                      child: ScheduleHeaderWidget(
                        weeklyKey: _weeklyKey,
                        consultationKey: _consultationKey,
                      ),
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
                            children: [
                              ResponsiveRowColumnItem(
                                rowFlex: 6,
                                child: WeeklyAvailabilityWidget(key: _weeklyKey),
                              ),
                              ResponsiveRowColumnItem(
                                rowFlex: 4,
                                child: ConsultationParametersWidget(key: _consultationKey),
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
