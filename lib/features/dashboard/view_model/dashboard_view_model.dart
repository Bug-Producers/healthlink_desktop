import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/models/models.dart';
import '../../../../core/repositories/doctor_repository.dart';

part 'dashboard_view_model.g.dart';

@riverpod
class DashboardViewModel extends _$DashboardViewModel {
  @override
  Future<DoctorProfile> build() async {
    final repository = ref.watch(doctorRepositoryProvider);
    return await repository.getProfile();
  }

  Future<void> updateProfile(DoctorProfile profile) async {
    final repository = ref.read(doctorRepositoryProvider);
    await repository.updateProfile(profile);
    ref.invalidateSelf();
  }
}
