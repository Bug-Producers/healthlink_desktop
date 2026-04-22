import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class CustomTimeRangePickerDialog extends StatefulWidget {
  const CustomTimeRangePickerDialog({super.key});

  @override
  State<CustomTimeRangePickerDialog> createState() => _CustomTimeRangePickerDialogState();
}

class _CustomTimeRangePickerDialogState extends State<CustomTimeRangePickerDialog> {
  int _startHour = 9;
  int _startMin = 0;
  int _endHour = 17;
  int _endMin = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Time Range",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Scroll the hours and minutes to set your availability slot.",
              style: TextStyle(
                color: Color(0XFF5a6362),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 32),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTimeSelector(
                  title: "Start Time",
                  hour: _startHour,
                  minute: _startMin,
                  onHourChanged: (val) => setState(() => _startHour = val),
                  onMinuteChanged: (val) => setState(() => _startMin = val),
                ),
                Container(
                  height: 100,
                  width: 1,
                  color: const Color(0XFFe8ecef),
                ),
                _buildTimeSelector(
                  title: "End Time",
                  hour: _endHour,
                  minute: _endMin,
                  onHourChanged: (val) => setState(() => _endHour = val),
                  onMinuteChanged: (val) => setState(() => _endMin = val),
                ),
              ],
            ),
            
            const SizedBox(height: 40),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: Color(0XFF5a6362),
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    final startFormatted = "${_startHour.toString().padLeft(2, '0')}:${_startMin.toString().padLeft(2, '0')}";
                    final endFormatted = "${_endHour.toString().padLeft(2, '0')}:${_endMin.toString().padLeft(2, '0')}";
                    Navigator.of(context).pop("$startFormatted - $endFormatted");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF006D60),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Add Slot",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSelector({
    required String title,
    required int hour,
    required int minute,
    required ValueChanged<int> onHourChanged,
    required ValueChanged<int> onMinuteChanged,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0XFFF8F9FB),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0XFFe8ecef)),
          ),
          child: Row(
            children: [
              _CustomScrollPicker(
                itemCount: 24,
                initialItem: hour,
                onSelectedItemChanged: onHourChanged,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(":", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              _CustomScrollPicker(
                itemCount: 60,
                initialItem: minute,
                onSelectedItemChanged: onMinuteChanged,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DragScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class _CustomScrollPicker extends StatefulWidget {
  final int itemCount;
  final int initialItem;
  final ValueChanged<int> onSelectedItemChanged;

  const _CustomScrollPicker({
    required this.itemCount,
    required this.initialItem,
    required this.onSelectedItemChanged,
  });

  @override
  State<_CustomScrollPicker> createState() => _CustomScrollPickerState();
}

class _CustomScrollPickerState extends State<_CustomScrollPicker> {
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController(initialItem: widget.initialItem);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 50,
      child: ScrollConfiguration(
        behavior: _DragScrollBehavior(),
        child: ListWheelScrollView.useDelegate(
          controller: _controller,
          itemExtent: 40,
          physics: const FixedExtentScrollPhysics(),
          onSelectedItemChanged: widget.onSelectedItemChanged,
          overAndUnderCenterOpacity: 0.3,
          childDelegate: ListWheelChildBuilderDelegate(
            builder: (context, index) {
              return Center(
                child: Text(
                  index.toString().padLeft(2, '0'),
                  style: const TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              );
            },
            childCount: widget.itemCount,
          ),
        ),
      ),
    );
  }
}

