import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/models/models.dart';
import '../../../../core/repositories/doctor_repository.dart';

part 'schedule_view_model.g.dart';

@riverpod
class ScheduleViewModel extends _$ScheduleViewModel {
  @override
  Future<DoctorSchedule> build() async {
    final repository = ref.watch(doctorRepositoryProvider);
    return await repository.getSchedule();
  }

  Future<void> updateSchedule(DoctorSchedule schedule) async {
    final repository = ref.read(doctorRepositoryProvider);
    await repository.updateSchedule(schedule);
    ref.invalidateSelf();
  }
}
