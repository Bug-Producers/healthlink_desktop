import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/models/models.dart';
import '../../../../core/repositories/doctor_repository.dart';

part 'schedule_view_model.g.dart';

/// The [ScheduleViewModel] manages the doctor's weekly availability state.
///
/// It coordinates between the schedule UI and the [DoctorRepository] to 
/// fetch, display, and update active time slots.
@riverpod
class ScheduleViewModel extends _$ScheduleViewModel {
  /// Fetches the initial schedule data from the repository.
  /// 
  /// @return A [Future] resolving to the [DoctorSchedule].
  @override
  Future<DoctorSchedule> build() async {
    final repository = ref.watch(doctorRepositoryProvider);
    return await repository.getSchedule();
  }

  /// Updates the full weekly availability and refreshes the local state.
  /// 
  /// @param schedule The new [DoctorSchedule] to persist.
  /// @return A [Future] that completes when the update is finished.
  Future<void> updateSchedule(DoctorSchedule schedule) async {
    final repository = ref.read(doctorRepositoryProvider);
    await repository.updateSchedule(schedule);
    ref.invalidateSelf();
  }

  /// Alias for [updateSchedule] to provide semantic consistency in the UI.
  /// 
  /// @param schedule The schedule to save.
  /// @return A [Future] that completes when saved.
  Future<void> saveSchedule(DoctorSchedule schedule) => updateSchedule(schedule);
}
