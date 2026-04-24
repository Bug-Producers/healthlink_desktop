import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/models/models.dart';
import '../../../../core/repositories/doctor_repository.dart';
import '../../../../core/network/websocket_client.dart';

part 'appointments_view_model.g.dart';

@riverpod
class AppointmentsViewModel extends _$AppointmentsViewModel {
  @override
  Future<List<Appointment>> build() async {
    final repository = ref.watch(doctorRepositoryProvider);
    final wsClient = ref.watch(webSocketClientProvider);

    // Auto-refresh when websocket emits a message.
    // In a production app, we'd check if the message is an appointment update,
    // but the prompt implies auto-updating on any new appointment notification.
    final sub = wsClient.notifications.listen((event) {
      ref.invalidateSelf();
    });

    ref.onDispose(() {
      sub.cancel();
    });

    return await repository.getAppointments();
  }

  Future<void> updateStatus(String id, int status) async {
    final repository = ref.read(doctorRepositoryProvider);
    await repository.updateAppointmentStatus(id, status);
    ref.invalidateSelf();
  }
}
