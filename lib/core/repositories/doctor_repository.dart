import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/models.dart';
import '../network/api_client.dart';

part 'doctor_repository.g.dart';

/// The [DoctorRepository] is the primary interface for managing a doctor's
/// professional profile, schedule, and patient interactions.
class DoctorRepository {
  /// The HTTP client for API communication.
  final Dio _dio;

  /// Creates a [DoctorRepository] instance.
  /// 
  /// @param _dio The configured Dio client.
  DoctorRepository(this._dio);

  /// Safely converts any dynamic value into a Map<String, dynamic>.
  /// Handles Map, String-wrapped JSON, and fallback to empty map.
  Map<String, dynamic> _safeMap(dynamic e) {
    if (e is Map<String, dynamic>) return e;
    if (e is Map) return Map<String, dynamic>.from(e);
    return {};
  }

  /// Safely extracts a List from a response that could be a List directly,
  /// a Map with a specific key, or something unexpected.
  List _safeList(dynamic data, String key) {
    if (data is List) return data;
    if (data is Map && data.containsKey(key)) {
      final val = data[key];
      if (val is List) return val;
    }
    return [];
  }

  /// Registers a new doctor profile on the HealthLink backend.
  /// 
  /// @param registration The complete [DoctorRegistration] payload.
  /// @return A [Future] that completes upon successful registration.
  Future<void> register(DoctorRegistration registration) async {
    await _dio.post(
      '/api/doctors/register',
      data: registration.toJson(),
    );
  }

  /// Verifies if a specific Firebase UID is registered as a doctor.
  /// 
  /// @param uuid The Firebase unique identifier of the user.
  /// @return A [Future] resolving to [true] if the user is a doctor, [false] otherwise.
  Future<bool> isDoctor(String uuid) async {
    final response = await _dio.post('/api/is-it-doctor', data: {'uuid': uuid});
    final data = _safeMap(response.data);
    return data['isDoctor'] == true;
  }

  /// Retrieves the current doctor's full profile details.
  /// 
  /// @return A [Future] resolving to the [DoctorProfile].
  Future<DoctorProfile> getProfile() async {
    final response = await _dio.get('/api/doctors/profile');
    return DoctorProfile.fromJson(_safeMap(response.data));
  }

  /// Updates the professional details of the authenticated doctor.
  /// 
  /// @param profile The updated [DoctorProfile] data.
  /// @return A [Future] that completes when the profile is updated.
  Future<void> updateProfile(DoctorProfile profile) async {
    await _dio.put(
      '/api/doctors/profile',
      data: profile.toJson(),
    );
  }

  /// Uploads and updates the doctor's profile picture.
  /// 
  /// @param base64Image The image data encoded as a base64 string.
  /// @return A [Future] that completes when the image is saved.
  Future<void> uploadProfileImage(String base64Image) async {
    await _dio.put(
      '/api/doctors/profile/image',
      data: {'image': base64Image},
    );
  }

  /// Fetches the weekly availability schedule for the doctor.
  /// 
  /// @return A [Future] resolving to the [DoctorSchedule].
  Future<DoctorSchedule> getSchedule() async {
    final response = await _dio.get('/api/doctors/schedule');
    return DoctorSchedule.fromJson(_safeMap(response.data));
  }

  /// Replaces the current weekly schedule with new availability.
  /// 
  /// @param schedule The new [DoctorSchedule] configuration.
  /// @return A [Future] that completes when the schedule is persisted.
  Future<void> updateSchedule(DoctorSchedule schedule) async {
    await _dio.put(
      '/api/doctors/schedule',
      data: schedule.toJson(),
    );
  }

  /// Retrieves all appointments associated with this doctor.
  /// 
  /// @return A [Future] resolving to a [List] of [Appointment] objects.
  Future<List<Appointment>> getAppointments() async {
    final response = await _dio.get('/api/doctors/appointments');
    final data = _safeList(response.data, 'appointments');
    return data.map((e) => Appointment.fromJson(_safeMap(e))).toList();
  }

  /// Updates the status of an existing appointment.
  /// 
  /// @param id The unique identifier of the appointment.
  /// @param status The new status code (0: Booked, 1: Completed, 2: Cancelled).
  /// @return A [Future] that completes when the status is updated.
  Future<void> updateAppointmentStatus(String id, int status) async {
    await _dio.patch(
      '/api/doctors/appointments/$id',
      data: {'status': status},
    );
  }

  /// Fetches aggregated rating statistics and feedback history.
  /// 
  /// @return A [Future] resolving to the [RatingsData].
  Future<RatingsData> getRatings() async {
    final response = await _dio.get('/api/doctors/ratings');
    return RatingsData.fromJson(_safeMap(response.data));
  }

  /// Retrieves all system-generated notifications for the doctor.
  /// 
  /// @return A [Future] resolving to a [List] of [SystemNotification] objects.
  Future<List<SystemNotification>> getNotifications() async {
    final response = await _dio.get('/api/doctors/notifications');
    final data = _safeList(response.data, 'notifications');
    return data.map((e) => SystemNotification.fromJson(_safeMap(e))).toList();
  }

  /// Marks a specific notification as 'read' on the server.
  /// 
  /// @param id The notification identifier.
  /// @return A [Future] that completes when the notification is marked.
  Future<void> markNotificationRead(String id) async {
    await _dio.patch(
      '/api/doctors/notifications/$id',
    );
  }
}

/// Provider for the [DoctorRepository].
/// 
/// @param ref The Riverpod [Ref].
/// @return A new instance of [DoctorRepository].
@riverpod
DoctorRepository doctorRepository(Ref ref) {
  final dio = ref.watch(apiClientProvider);
  return DoctorRepository(dio);
}
