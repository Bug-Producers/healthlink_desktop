import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/models.dart';
import '../network/api_client.dart';

part 'patient_repository.g.dart';

/// The [PatientRepository] facilitates access to patient data and medical records.
class PatientRepository {
  /// The HTTP client for network interactions.
  final Dio _dio;

  /// Constructs a [PatientRepository] with the provided Dio instance.
  /// 
  /// @param _dio The Dio instance configured with the API base URL and interceptors.
  PatientRepository(this._dio);

  Map<String, dynamic> _safeMap(dynamic e) {
    if (e is Map<String, dynamic>) return e;
    if (e is Map) return Map<String, dynamic>.from(e);
    return {};
  }

  List _safeList(dynamic data, String key) {
    if (data is List) return data;
    if (data is Map && data.containsKey(key)) {
      final val = data[key];
      if (val is List) return val;
    }
    return [];
  }

  /// Retrieves basic identity and profile data for a specific patient.
  /// 
  /// @param patientId The unique patient UID.
  /// @return A [Future] resolving to [PatientInfo].
  Future<PatientInfo> getPatient(String patientId) async {
    final response = await _dio.get('/api/patients/$patientId');
    return PatientInfo.fromJson(_safeMap(response.data));
  }

  /// Fetches the chronological medical history of a patient.
  /// 
  /// @param patientId The UID of the patient whose history is being requested.
  /// @return A [Future] resolving to a [List] of [PatientHistory] entries.
  Future<List<PatientHistory>> getPatientHistory(String patientId) async {
    final response = await _dio.get(
      '/api/patients/history',
      queryParameters: {'patientId': patientId},
    );
    final data = _safeList(response.data, 'history');
    return data.map((e) => PatientHistory.fromJson(_safeMap(e))).toList();
  }

  /// Appends a new medical report or diagnosis to the patient's records.
  /// 
  /// @param patientId The UID of the patient.
  /// @param report The text content of the report (diagnosis/prescription).
  /// @return A [Future] that completes when the report is added.
  Future<void> addPatientReport(String patientId, String report) async {
    await _dio.post(
      '/api/patients/history',
      data: {
        'patientId': patientId,
        'report': report,
      },
    );
  }
}

/// Provider for the [PatientRepository].
/// 
/// @param ref The Riverpod [Ref].
/// @return A new instance of [PatientRepository].
@riverpod
PatientRepository patientRepository(Ref ref) {
  final dio = ref.watch(apiClientProvider);
  return PatientRepository(dio);
}
