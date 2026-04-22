import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:healthlink_desktop/features/dashboard/view/widget/recent_activity_widget_overview.dart';
import '../../../../core/app_bar_widget.dart';
import '../widget/overview_text.dart';
import '../widget/overview_tiles.dart';
import '../widget/patient_waiting_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // If screen is larger than a tablet, we consider it Desktop
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    final paddingValue = ResponsiveValue<double>(
      context,
      defaultValue: 40.0,
      conditionalValues: [
        const Condition.smallerThan(name: TABLET, value: 16.0),
        const Condition.equals(name: TABLET, value: 24.0),
      ],
    ).value!;

    return Scaffold(
      backgroundColor: const Color(0XFFf7f9fb),
      body: SingleChildScrollView(
        child: Center(
          // ConstrainedBox prevents ultra-wide monitors from stretching the UI too far
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1440),
            child: Column(
              children: [
                const AppBarWidget(),
                SizedBox(height: ResponsiveValue<double>(context, defaultValue: 45.0, conditionalValues: [const Condition.smallerThan(name: TABLET, value: 24.0)]).value),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingValue),
                  child: const OverViewText(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingValue),
                  child: Column(
                    children: [
                      SizedBox(height: ResponsiveValue<double>(context, defaultValue: 31.0, conditionalValues: [const Condition.smallerThan(name: TABLET, value: 16.0)]).value),

                      // ── TOP SECTION: Analytics Tiles ──
                      // Each gets a flex of 1, so they evenly split the 100% width
                      ResponsiveRowColumn(
                        layout: isDesktop ? ResponsiveRowColumnType.ROW : ResponsiveRowColumnType.COLUMN,
                        rowSpacing: 24,
                        columnSpacing: 16,
                        children: const [
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: OverViewTiles(
                              title: "TODAY'S APPOINTMENTS", icon: Icons.calendar_month_outlined,
                              value: '8', subtitle: 'Scheduled',
                            ),
                          ),
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: OverViewTiles(
                              title: "TOTAL REVENUE", icon: Icons.payments_outlined,
                              value: "\$1,240", subtitle: "Today",
                            ),
                          ),
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: OverViewTiles(
                              title: "AVERAGE RATING", icon: Icons.star_border_outlined,
                              value: "4.8", subtitle: "/ 5.0",
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: ResponsiveValue<double>(context, defaultValue: 30.0, conditionalValues: [const Condition.smallerThan(name: TABLET, value: 20.0)]).value),

                      // ── BOTTOM SECTION: Main Content Area ──
                      // Patient Cards get 60% of the screen (flex: 6)
                      // Activity Timeline gets 40% of the screen (flex: 4)
                      ResponsiveRowColumn(
                        layout: isDesktop ? ResponsiveRowColumnType.ROW : ResponsiveRowColumnType.COLUMN,
                        rowCrossAxisAlignment: CrossAxisAlignment.start,
                        rowSpacing: 30,
                        columnSpacing: 20,
                        children: [
                          ResponsiveRowColumnItem(
                            rowFlex: 6, // 60% of the width
                            child: Column(
                              children: const [
                                PatientWaitingCard(),
                                SizedBox(height: 24),
                                PatientWaitingCard(),
                              ],
                            ),
                          ),

                          const ResponsiveRowColumnItem(
                            rowFlex: 4, // 40% of the width
                            child: RecentActivityWidget(),
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
      ),
    );
  }
}
