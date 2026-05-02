import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/app_bar_widget.dart';
import '../../../../core/utils/error_handler.dart';
import '../../view_model/appointments_view_model.dart';
import '../widget/appointments_header.dart';
import '../widget/appointments_list.dart';

/// [AppointmentScreen] manages the clinical agenda for the doctor.
///
/// It provides a comprehensive list of scheduled patient visits, enabling 
/// status updates, payment tracking, and medical record access.
class AppointmentScreen extends ConsumerWidget {
  /// Constructs an [AppointmentScreen].
  /// 
  /// @param key The widget key.
  const AppointmentScreen({super.key});

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

    final appointmentsState = ref.watch(appointmentsViewModelProvider);

    return Scaffold(
      backgroundColor: const Color(0XFFf7f9fb),
      body: SingleChildScrollView(
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
                      const AppointmentsHeaderWidget(),
                      const SizedBox(height: 31),
                      appointmentsState.when(
                        loading: () => const Center(
                          child: Padding(
                            padding: EdgeInsets.all(40),
                            child: CircularProgressIndicator(color: Color(0xFF006D60)),
                          ),
                        ),
                        error: (err, _) => Center(
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                            child: Text(
                              ErrorHandler.getMessage(err),
                              style: const TextStyle(color: Color(0XFF5a6362)),
                            ),
                          ),
                        ),
                        data: (_) => const AppointmentsListWidget(),
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
