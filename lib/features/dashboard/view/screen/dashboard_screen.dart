import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/app_bar_widget.dart';
import '../../../../core/utils/error_handler.dart';
import '../../view_model/dashboard_view_model.dart';
import '../widget/overview_text.dart';
import '../widget/overview_tiles.dart';
import '../widget/patient_waiting_card.dart';
import '../widget/recent_activity_widget_overview.dart';

/// [DashboardScreen] is the landing page for authenticated doctors.
///
/// It provides a high-level summary of the clinical status, including 
/// appointment counts, revenue highlights, and recent system notifications.
class DashboardScreen extends ConsumerWidget {
  /// Constructs a [DashboardScreen].
  /// 
  /// @param key The widget key.
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paddingValue = ResponsiveValue<double>(
      context,
      defaultValue: 40.0,
      conditionalValues: [
        const Condition.smallerThan(name: TABLET, value: 16.0),
        const Condition.equals(name: TABLET, value: 24.0),
      ],
    ).value;

    final dashboardState = ref.watch(dashboardViewModelProvider);

    return Scaffold(
      backgroundColor: const Color(0XFFf7f9fb),
      body: dashboardState.when(
        loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFF006D60))),
        error: (err, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.cloud_off, size: 64, color: Color(0XFFa5b0b5)),
              const SizedBox(height: 16),
              Text(
                ErrorHandler.getMessage(err),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0XFF5a6362), fontSize: 16),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => ref.invalidate(dashboardViewModelProvider),
                child: const Text('Retry Connection'),
              ),
            ],
          ),
        ),
        data: (data) => SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1440),
              child: Column(
                children: [
                  const AppBarWidget(),
                  const SizedBox(height: 45),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: paddingValue),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const OverViewText(),
                        const SizedBox(height: 31),
                        
                        // Main Analytics Tiles
                        ResponsiveRowColumn(
                          layout: ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                              ? ResponsiveRowColumnType.ROW
                              : ResponsiveRowColumnType.COLUMN,
                          rowSpacing: 20,
                          columnSpacing: 20,
                          children: [
                            ResponsiveRowColumnItem(
                              rowFlex: 1,
                              child: OverViewTiles(
                                title: "TODAY'S APPOINTMENTS",
                                icon: Icons.calendar_today,
                                value: "${data.todayAppointmentCount}",
                                subtitle: "Patients",
                              ),
                            ),
                            ResponsiveRowColumnItem(
                              rowFlex: 1,
                              child: OverViewTiles(
                                title: "TOTAL REVENUE",
                                icon: Icons.payments,
                                value: "\$${(data.revenue.totalEarnings ?? 0).toStringAsFixed(0)}",
                                subtitle: "This Month",
                                iconColor: const Color(0xFF006D60),
                              ),
                            ),
                            ResponsiveRowColumnItem(
                              rowFlex: 1,
                              child: OverViewTiles(
                                title: "PATIENT SATISFACTION",
                                icon: Icons.star,
                                value: (data.ratings.averageRating ?? 0).toStringAsFixed(1),
                                subtitle: "Avg Rating",
                                iconColor: Colors.amber,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        
                        // Secondary Dashboard Area
                        ResponsiveRowColumn(
                          layout: ResponsiveBreakpoints.of(context).largerThan(TABLET)
                              ? ResponsiveRowColumnType.ROW
                              : ResponsiveRowColumnType.COLUMN,
                          rowCrossAxisAlignment: CrossAxisAlignment.start,
                          rowSpacing: 30,
                          columnSpacing: 30,
                          children: [
                            ResponsiveRowColumnItem(
                              rowFlex: 6,
                              child: data.upcomingAppointments.isNotEmpty 
                                ? PatientWaitingCard(
                                    appointment: data.upcomingAppointments.first,
                                    onMarkComplete: () {
                                      ref.read(dashboardViewModelProvider.notifier).updateAppointmentStatus(data.upcomingAppointments.first.id, 1);
                                    },
                                  )
                                : const Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(40),
                                      child: Center(child: Text("No upcoming appointments")),
                                    ),
                                  ),
                            ),
                            ResponsiveRowColumnItem(
                              rowFlex: 4,
                              child: RecentActivityWidget(
                                notifications: data.notifications,
                              ),
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
      ),
    );
  }
}
