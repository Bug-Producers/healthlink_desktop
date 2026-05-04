import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/models/models.dart';
import '../../../../core/utils/error_handler.dart';
import '../../../dashboard/view_model/dashboard_view_model.dart';
import '../../view_model/schedule_view_model.dart';

/// [ScheduleHeaderWidget] acts as the command bar for the Schedule Management 
/// screen, providing the primary save and discard actions.
///
/// It orchestrates the collection of state from multiple child widgets 
/// ([WeeklyAvailabilityWidget] and [ConsultationParametersWidget]) via 
/// [GlobalKey]s to perform a unified update to the backend.
class ScheduleHeaderWidget extends ConsumerWidget {
  /// Reference to the availability widget state.
  final GlobalKey<dynamic>? weeklyKey;
  
  /// Reference to the parameters widget state.
  final GlobalKey<dynamic>? consultationKey;

  /// Constructs a [ScheduleHeaderWidget].
  /// 
  /// @param key The widget key.
  /// @param weeklyKey The key for the weekly availability form.
  /// @param consultationKey The key for the consultation parameters form.
  const ScheduleHeaderWidget({
    super.key,
    this.weeklyKey,
    this.consultationKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 600;

        return ResponsiveRowColumn(
          layout: isDesktop ? ResponsiveRowColumnType.ROW : ResponsiveRowColumnType.COLUMN,
          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
          rowCrossAxisAlignment: CrossAxisAlignment.start,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          columnSpacing: 20,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: isDesktop ? 1 : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Schedule Management",
                    style: TextStyle(color: Colors.black, fontSize: 36, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Configure your weekly availability and consultation parameters to ensure a smooth\nbooking experience for your patients.",
                    style: TextStyle(color: Color(0XFF5a6362), fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            ResponsiveRowColumnItem(
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  TextButton(
                    onPressed: () {
                      weeklyKey?.currentState?.resetState();
                      consultationKey?.currentState?.resetState();
                      ref.invalidate(scheduleViewModelProvider);
                      ref.invalidate(dashboardViewModelProvider);
                      ErrorHandler.showSuccess(context, 'Changes discarded. Reloading from server.');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0XFFe8ecef),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      "Discard\nChanges",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0XFF0d4c6d), fontSize: 15, fontWeight: FontWeight.w700, height: 1.2),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      try {
                        // Build availability map from the weekly widget state
                        final weeklyState = weeklyKey?.currentState;
                        if (weeklyState != null) {
                          final activeDays = weeklyState.currentActiveDays as Map<String, bool>;
                          final timeRanges = weeklyState.currentSchedule as Map<String, List<String>>;

                          final Map<String, List<TimeSlot>> availability = {};
                          for (final entry in timeRanges.entries) {
                            if (activeDays[entry.key] == true) {
                              availability[entry.key] = entry.value.map((t) {
                                final parts = t.split(' - ');
                                return TimeSlot(startTime: parts[0].trim(), endTime: parts[1].trim());
                              }).toList();
                            }
                          }
                          final consultationState = consultationKey?.currentState;
                          final duration = consultationState?.durationMinutes ?? 30;
                          final buffer = consultationState?.bufferMinutes ?? 10;

                          final schedule = DoctorSchedule(
                            availability: availability,
                            appointmentDuration: duration,
                            bufferTime: buffer,
                          );
                          await ref.read(scheduleViewModelProvider.notifier).saveSchedule(schedule);
                        }

                        // Consultation parameters should not be saved via the profile endpoint here.
                        // The user requested to only hit the schedule endpoint.

                        if (context.mounted) {
                          ErrorHandler.showSuccess(context, 'Schedule saved successfully!');
                        }
                      } catch (e) {
                        if (context.mounted) ErrorHandler.showError(context, e);
                      }
                    },
                    icon: const Icon(Icons.save_outlined, size: 20, color: Colors.white),
                    label: const Text(
                      "Save\nSchedule",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700, height: 1.2),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFF006D60),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
