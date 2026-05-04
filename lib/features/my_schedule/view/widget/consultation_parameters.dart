import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../view_model/schedule_view_model.dart';

/// [ConsultationParametersWidget] enables doctors to configure the temporal 
/// constraints of their appointments.
///
/// It provides controls for session duration and administrative buffers, 
/// directly impacting the slot generation logic in the patient-facing client.
class ConsultationParametersWidget extends ConsumerStatefulWidget {
  /// Constructs a [ConsultationParametersWidget].
  /// 
  /// @param key The widget key.
  const ConsultationParametersWidget({super.key});

  @override
  ConsumerState<ConsultationParametersWidget> createState() => ConsultationParametersWidgetState();
}

/// State for [ConsultationParametersWidget], exposing current settings for bulk saving.
class ConsultationParametersWidgetState extends ConsumerState<ConsultationParametersWidget> {
  String _appointmentDuration = "30 minutes";
  String _bufferTime = "10 minutes";
  bool _initialized = false;

  final List<String> _durationOptions = ["15 minutes", "20 minutes", "30 minutes", "45 minutes", "60 minutes"];
  final List<String> _bufferOptions = ["None", "5 minutes", "10 minutes", "15 minutes", "30 minutes"];

  /// Extracts the appointment duration in minutes.
  /// 
  /// @return The integer minute value.
  int get durationMinutes {
    if (_appointmentDuration == "None") return 0;
    return int.tryParse(_appointmentDuration.replaceAll(' minutes', '')) ?? 30;
  }
  
  /// Extracts the buffer time in minutes.
  /// 
  /// @return The integer minute value.
  int get bufferMinutes {
    if (_bufferTime == "None") return 0;
    return int.tryParse(_bufferTime.replaceAll(' minutes', '')) ?? 10;
  }

  /// Resets the local state to force a reload from the provider.
  void resetState() {
    setState(() {
      _initialized = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheduleState = ref.watch(scheduleViewModelProvider);
    scheduleState.whenData((schedule) {
      if (!_initialized) {
        _initialized = true;
        final dur = schedule.appointmentDuration;
        final buf = schedule.bufferTime;
        setState(() {
          _appointmentDuration = "$dur minutes";
          _bufferTime = buf == 0 ? "None" : "$buf minutes";
        });
      }
    });

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
            "CONSULTATION PARAMETERS",
            style: TextStyle(color: Color(0XFF5a6362), fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: 1.5),
          ),
          const SizedBox(height: 32),
          _buildSection(
            icon: Icons.timer_outlined,
            title: "Appointment Duration",
            subtitle: "Base length for standard bookings.",
            dropdownValue: _appointmentDuration,
            options: _durationOptions,
            onChanged: (String? newValue) {
              if (newValue != null) setState(() => _appointmentDuration = newValue);
            },
          ),
          const SizedBox(height: 32),
          _buildSection(
            icon: Icons.hourglass_empty,
            title: "Buffer Time",
            subtitle: "Gap between appointments for admin/prep.",
            dropdownValue: _bufferTime,
            options: _bufferOptions,
            onChanged: (String? newValue) {
              if (newValue != null) setState(() => _bufferTime = newValue);
            },
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0XFFF1F4F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, color: Color(0XFF0d4c6d), size: 20),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    "Changes to these parameters will only affect future bookings. Existing appointments will retain their scheduled duration.",
                    style: TextStyle(color: Color(0XFF5a6362), fontSize: 14, height: 1.5, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a configuration section for a specific parameter.
  /// 
  /// @param icon The section icon.
  /// @param title The section title.
  /// @param subtitle Explanatory text.
  /// @param dropdownValue Current selected value.
  /// @param options List of available options.
  /// @param onChanged Callback for value changes.
  /// @return A configured [Widget].
  Widget _buildSection({
    required IconData icon, required String title, required String subtitle,
    required String dropdownValue, required List<String> options, required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Icon(icon, size: 20, color: Colors.black),
          const SizedBox(width: 12),
          Flexible(child: Text(title, style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700), overflow: TextOverflow.ellipsis)),
        ]),
        const SizedBox(height: 8),
        Text(subtitle, style: const TextStyle(color: Color(0XFF5a6362), fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(color: const Color(0XFFF1F4F5), borderRadius: BorderRadius.circular(8)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.keyboard_arrow_down, color: Color(0XFF5a6362)),
              isExpanded: true, dropdownColor: Colors.white, borderRadius: BorderRadius.circular(8),
              style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
              onChanged: onChanged,
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(value: value, child: Text(value));
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
