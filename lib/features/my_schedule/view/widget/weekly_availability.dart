import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'custom_time_range_picker.dart';

class WeeklyAvailabilityWidget extends StatefulWidget {
  const WeeklyAvailabilityWidget({super.key});

  @override
  State<WeeklyAvailabilityWidget> createState() => _WeeklyAvailabilityWidgetState();
}

class _WeeklyAvailabilityWidgetState extends State<WeeklyAvailabilityWidget> {
  final Map<String, bool> _activeDays = {
    "Monday": true,
    "Tuesday": true,
    "Wednesday": false,
    "Thursday": true,
    "Friday": true,
    "Saturday": false,
    "Sunday": false,
  };

  final Map<String, List<String>> _timeRanges = {
    "Monday": ["09:00 - 12:00", "14:00 - 18:00"],
    "Tuesday": ["09:00 - 15:00"],
    "Wednesday": [],
    "Thursday": ["09:00 - 15:00"],
    "Friday": ["09:00 - 12:00"],
    "Saturday": [],
    "Sunday": [],
  };

  final List<String> _daysOfWeek = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: TextStyle(
              color: Color(0XFF5a6362),
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
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
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildDayRow({
    required BuildContext context,
    required String day,
    required bool isActive,
    required List<String> timeRanges,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use local available width instead of global screen width.
        // This makes the widget perfectly responsive even inside split-screens or sidebars.
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
                          day,
                          style: TextStyle(
                            color: isActive ? Colors.black : const Color(0XFFa0a7a6),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
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
                        spacing: 12,
                        runSpacing: 12,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          ...timeRanges.map((time) => _buildTimeChip(day, time)),
                          _buildAddButton(context, day),
                        ],
                      )
                    : const Text(
                        "Unavailable",
                        style: TextStyle(
                          color: Color(0XFFa0a7a6),
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

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
            child: Text(
              time,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 12),
          InkWell(
            onTap: () {
              setState(() {
                _timeRanges[day]?.remove(time);
              });
            },
            child: const Icon(
              Icons.close,
              size: 16,
              color: Color(0XFF5a6362),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton(BuildContext context, String day) {
    return InkWell(
      onTap: () async {
        final result = await showDialog<String>(
          context: context,
          builder: (context) => const CustomTimeRangePickerDialog(),
        );
        if (result != null) {
          setState(() {
            _timeRanges[day]?.add(result);
          });
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.add, size: 16, color: Color(0XFF006D60)),
            SizedBox(width: 8),
            Flexible(
              child: Text(
                "Add Time",
                style: TextStyle(
                  color: Color(0XFF006D60),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
