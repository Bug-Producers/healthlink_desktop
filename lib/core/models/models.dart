// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

/// The [DoctorProfile] model encapsulates all public and professional information
/// about a doctor. It is used both for display in the doctor's own settings 
/// and as the data source for patient-facing profiles.
@freezed
abstract class DoctorProfile with _$DoctorProfile {
  const factory DoctorProfile({
    @JsonKey(name: 'uuid') String? id,
    String? name,
    String? city,
    String? country,
    String? hospitalOrClinicName,
    String? about,
    int? appointmentDuration,
    int? bufferTime,
    @JsonKey(name: 'profileImage') String? image,
    Map<String, dynamic>? department,
    int? expYears,
  }) = _DoctorProfile;

  factory DoctorProfile.fromJson(Map<String, dynamic> json) => _$DoctorProfileFromJson(json);
}

/// [DoctorRegistration] defines the required payload for creating a new doctor
/// account on the HealthLink platform. It collects identity, location, and 
/// professional configuration like default appointment lengths.
@freezed
abstract class DoctorRegistration with _$DoctorRegistration {
  const factory DoctorRegistration({
    required String name,
    required String city,
    required String country,
    required String hospitalOrClinicName,
    required String about,
    required int appointmentDuration,
    required int bufferTime,
    required Map<String, String> department,
    required int expYears,
  }) = _DoctorRegistration;

  factory DoctorRegistration.fromJson(Map<String, dynamic> json) => _$DoctorRegistrationFromJson(json);
}

/// A [TimeSlot] represents a specific window of availability within a doctor's day.
/// These are used to generate bookable slots for patients.
@freezed
abstract class TimeSlot with _$TimeSlot {
  const factory TimeSlot({
    required String startTime,
    required String endTime,
  }) = _TimeSlot;

  factory TimeSlot.fromJson(Map<String, dynamic> json) => _$TimeSlotFromJson(json);
}

/// [DoctorSchedule] organizes a doctor's availability across the entire week.
/// The [availability] map uses day names (e.g., 'monday') as keys to lists 
/// of active [TimeSlot] objects.
@freezed
abstract class DoctorSchedule with _$DoctorSchedule {
  const factory DoctorSchedule({
    String? doctorId,
    @Default({}) Map<String, List<TimeSlot>> availability,
  }) = _DoctorSchedule;

  factory DoctorSchedule.fromJson(Map<String, dynamic> json) => _$DoctorScheduleFromJson(json);
}

/// An [Appointment] represents a confirmed meeting between a doctor and a patient.
/// It includes timing details and the current [status] (0: Booked, 1: Completed, 2: Cancelled).
@freezed
abstract class Appointment with _$Appointment {
  const factory Appointment({
    @Default('') String id,
    @Default('') String doctorId,
    String? patientId,
    String? patientName,
    String? patientImage,
    @Default('') String date,
    @Default('') String startTime,
    @Default('') String endTime,
    @Default(0) int status,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);
}

/// [Payment] tracks a financial transaction between a patient and a doctor.
/// Currently, this application focuses on manual cash payments recorded by the doctor.
@freezed
abstract class Payment with _$Payment {
  const factory Payment({
    String? id,
    required String patientId,
    required String appointmentId,
    double? amount,
    String? date,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);
}

/// [DailyBreakdown] provides a snapshot of total earnings for a specific date,
/// primarily used for rendering revenue trend charts.
@freezed
abstract class DailyBreakdown with _$DailyBreakdown {
  const factory DailyBreakdown({
    @Default('') String date,
    double? total,
  }) = _DailyBreakdown;

  factory DailyBreakdown.fromJson(Map<String, dynamic> json) => _$DailyBreakdownFromJson(json);
}

/// [RevenueData] provides a high-level summary of the doctor's earnings, 
/// including total figures and a day-by-day [dailyBreakdown] for analytics.
@freezed
abstract class RevenueData with _$RevenueData {
  const factory RevenueData({
    @Default(0.0) double? totalEarnings,
    @Default(0) int? totalPayments,
    @Default([]) List<DailyBreakdown>? dailyBreakdown,
  }) = _RevenueData;

  factory RevenueData.fromJson(Map<String, dynamic> json) => _$RevenueDataFromJson(json);
}

/// [SystemNotification] represents an alert sent to the doctor, such as a 
/// new booking, a cancellation, or a patient leaving a rating.
@freezed
abstract class SystemNotification with _$SystemNotification {
  const factory SystemNotification({
    @Default('') String id,
    @Default('') String message,
    @Default(false) bool read,
    String? date,
  }) = _SystemNotification;

  factory SystemNotification.fromJson(Map<String, dynamic> json) => _$SystemNotificationFromJson(json);
}

/// [Rating] holds the feedback left by a patient after an appointment.
/// It consists of a star count (1-5) and an optional written comment.
@freezed
abstract class Rating with _$Rating {
  const factory Rating({
    String? id,
    String? patientName,
    String? patientId,
    @Default(5) int stars,
    String? comment,
    String? date,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}

/// [RatingsData] aggregates all feedback for a doctor, providing the 
/// [averageRating] and the total count of reviews.
@freezed
abstract class RatingsData with _$RatingsData {
  const factory RatingsData({
    @Default(0.0) double? averageRating,
    @Default(0) int? totalRatings,
    @Default([]) List<Rating>? ratings,
  }) = _RatingsData;

  factory RatingsData.fromJson(Map<String, dynamic> json) => _$RatingsDataFromJson(json);
}

/// [PatientHistory] represents a single entry in a patient's medical record.
/// These are typically displayed in reverse-chronological order (LIFO) to 
/// show the most recent diagnosis or treatment first.
@freezed
abstract class PatientHistory with _$PatientHistory {
  const factory PatientHistory({
    String? id,
    String? patientId,
    required String report,
    String? date,
  }) = _PatientHistory;

  factory PatientHistory.fromJson(Map<String, dynamic> json) => _$PatientHistoryFromJson(json);
}

/// [PatientInfo] contains basic identity data for a patient. It is used in 
/// contexts where a full medical history is not required, such as a simple list.
@freezed
abstract class PatientInfo with _$PatientInfo {
  const factory PatientInfo({
    String? id,
    String? name,
    String? image,
  }) = _PatientInfo;

  factory PatientInfo.fromJson(Map<String, dynamic> json) => _$PatientInfoFromJson(json);
}
