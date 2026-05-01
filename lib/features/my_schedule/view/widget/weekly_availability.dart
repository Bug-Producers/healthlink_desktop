import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/utils/error_handler.dart';
import '../../view_model/schedule_view_model.dart';
import 'custom_time_range_picker.dart';

/// [WeeklyAvailabilityWidget] manages the interactive weekly calendar for a doctor.
///
/// It allows for granular control over clinical hours, supporting multiple 
/// non-contiguous time slots per day. The widget manages its own local 
/// editing state to allow for bulk updates via the [ScheduleHeaderWidget].
class WeeklyAvailabilityWidget extends ConsumerStatefulWidget {
  /// Constructs a [WeeklyAvailabilityWidget].
  /// 
  /// @param key The widget key.
  const WeeklyAvailabilityWidget({super.key});

  @override
  ConsumerState<WeeklyAvailabilityWidget> createState() => WeeklyAvailabilityWidgetState();
}

/// State for [WeeklyAvailabilityWidget], exposing its local schedule data to parents.
class WeeklyAvailabilityWidgetState extends ConsumerState<WeeklyAvailabilityWidget> {
  Map<String, bool> _activeDays = {};
  Map<String, List<String>> _timeRanges = {};
  bool _loaded = false;

  final List<String> _daysOfWeek = [
    "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"
  ];

  final Map<String, String> _dayLabels = {
    "monday": "Monday", "tuesday": "Tuesday", "wednesday": "Wednesday",
    "thursday": "Thursday", "friday": "Friday", "saturday": "Saturday", "sunday": "Sunday",
  };

  @override
  Widget build(BuildContext context) {
    final scheduleState = ref.watch(scheduleViewModelProvider);

    // Initialize local state from API data once
    scheduleState.whenData((schedule) {
      if (!_loaded) {
        _loaded = true;
        final avail = schedule.availability;
        for (final day in _daysOfWeek) {
          final slots = avail[day] ?? [];
          _activeDays[day] = slots.isNotEmpty;
          _timeRanges[day] = slots.map((s) => "${s.startTime} - ${s.endTime}").toList();
        }
      }
    });

    return scheduleState.when(
      loading: () => const Center(
        child: Padding(padding: EdgeInsets.all(48), child: CircularProgressIndicator(color: Color(0xFF006D60))),
      ),
      error: (err, _) => Center(
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(ErrorHandler.getMessage(err), style: const TextStyle(color: Color(0xFF5a6362))),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () { _loaded = false; ref.invalidate(scheduleViewModelProvider); },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      data: (_) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "WEEKLY AVAILABILITY",
              style: TextStyle(color: Color(0XFF5a6362), fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: 1.5),
            ),
            const SizedBox(height: 24),
            const Divider(height: 1, color: Color(0XFFe8ecef)),
            const SizedBox(height: 24),
            ..._daysOfWeek.map((day) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _buildDayRow(
                  context: context,
                  day: day,
                  isActive: _activeDays[day] ?? false,
                  timeRanges: _timeRanges[day] ?? [],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  /// Exports the currently edited schedule map.
  /// 
  /// @return A [Map] of days to their assigned time range strings.
  Map<String, List<String>> get currentSchedule => Map.from(_timeRanges);
  
  /// Exports the currently toggled active state of each day.
  /// 
  /// @return A [Map] of days to their enabled status.
  Map<String, bool> get currentActiveDays => Map.from(_activeDays);

  /// Builds a row representing a single day's schedule.
  /// 
  /// @param context The build context.
  /// @param day The technical day key.
  /// @param isActive Whether the day is currently enabled.
  /// @param timeRanges List of existing time ranges.
  /// @return A responsive row widget.
  Widget _buildDayRow({
    required BuildContext context,
    required String day,
    required bool isActive,
    required List<String> timeRanges,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 350;
        return Container(
          decoration: BoxDecoration(
            color: const Color(0XFFF8F9FB),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: ResponsiveRowColumn(
            layout: isDesktop ? ResponsiveRowColumnType.ROW : ResponsiveRowColumnType.COLUMN,
            rowCrossAxisAlignment: CrossAxisAlignment.center,
            columnCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResponsiveRowColumnItem(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: 100,
                        child: Text(
                          _dayLabels[day] ?? day,
                          style: TextStyle(
                            color: isActive ? Colors.black : const Color(0XFFa0a7a6),
                            fontSize: 16, fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Switch(
                      value: isActive,
                      onChanged: (val) {
                        setState(() {
                          _activeDays[day] = val;
                          if (val && timeRanges.isEmpty) {
                            _timeRanges[day]!.add("09:00 - 17:00");
                          }
                        });
                      },
                      activeColor: Colors.white,
                      activeTrackColor: const Color(0XFF006D60),
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: const Color(0XFFd2d6d5),
                    ),
                  ],
                ),
              ),
              if (isDesktop) const ResponsiveRowColumnItem(child: SizedBox(width: 24)),
              if (!isDesktop) const ResponsiveRowColumnItem(child: SizedBox(height: 16)),
              ResponsiveRowColumnItem(
                rowFlex: isDesktop ? 1 : null,
                child: isActive
                    ? Wrap(
                        spacing: 12, runSpacing: 12,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          ...timeRanges.map((time) => _buildTimeChip(day, time)),
                          _buildAddButton(context, day),
                        ],
                      )
                    : const Text(
                        "Unavailable",
                        style: TextStyle(color: Color(0XFFa0a7a6), fontSize: 15, fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Renders a removable time slot chip.
  /// 
  /// @param day The parent day.
  /// @param time The time range string.
  /// @return A stylized chip widget.
  Widget _buildTimeChip(String day, String time) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0XFFe8ecef)),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(time, style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(width: 12),
          InkWell(
            onTap: () => setState(() => _timeRanges[day]?.remove(time)),
            child: const Icon(Icons.close, size: 16, color: Color(0XFF5a6362)),
          ),
        ],
      ),
    );
  }

  /// Builds a button to trigger the time range picker.
  /// 
  /// @param context The build context.
  /// @param day The target day.
  /// @return An interactive button widget.
  Widget _buildAddButton(BuildContext context, String day) {
    return InkWell(
      onTap: () async {
        final result = await showDialog<String>(
          context: context,
          builder: (context) => const CustomTimeRangePickerDialog(),
        );
        if (result != null) {
          setState(() => _timeRanges[day]?.add(result));
        }
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: const Color(0XFF006D60), width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, size: 16, color: Color(0XFF006D60)),
            SizedBox(width: 8),
            Flexible(child: Text("Add Time", style: TextStyle(color: Color(0XFF006D60), fontSize: 15, fontWeight: FontWeight.w700), overflow: TextOverflow.ellipsis)),
          ],
        ),
      ),
    );
  }
}
