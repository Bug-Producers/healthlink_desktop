import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/models.dart';
import '../network/api_client.dart';

part 'doctor_repository.g.dart';

class DoctorRepository {
  final Dio _dio;

  DoctorRepository(this._dio);

  Future<DoctorProfile> getProfile() async {
    final response = await _dio.get('/api/doctors/profile');
    return DoctorProfile.fromJson(response.data);
  }

  Future<void> updateProfile(DoctorProfile profile) async {
    await _dio.put('/api/doctors/profile', data: profile.toJson());
  }

  Future<DoctorSchedule> getSchedule() async {
    final response = await _dio.get('/api/doctors/schedule');
    return DoctorSchedule.fromJson(response.data);
  }

  Future<void> updateSchedule(DoctorSchedule schedule) async {
    await _dio.put('/api/doctors/schedule', data: schedule.toJson());
  }

  Future<List<Appointment>> getAppointments() async {
    final response = await _dio.get('/api/doctors/appointments');
    final data = response.data as List;
    return data.map((e) => Appointment.fromJson(e)).toList();
  }

  Future<void> updateAppointmentStatus(String id, int status) async {
    await _dio.patch('/api/doctors/appointments/$id', data: {'status': status});
  }

  Future<List<SystemNotification>> getNotifications() async {
    final response = await _dio.get('/api/doctors/notifications');
    final data = response.data as List;
    return data.map((e) => SystemNotification.fromJson(e)).toList();
  }

  Future<void> markNotificationRead(String id) async {
    await _dio.patch('/api/doctors/notifications/$id');
  }
}

@riverpod
DoctorRepository doctorRepository(Ref ref) {
  final dio = ref.watch(apiClientProvider);
  return DoctorRepository(dio);
}
