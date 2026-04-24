import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
abstract class DoctorProfile with _$DoctorProfile {
  const factory DoctorProfile({
    String? id,
    String? name,
    String? city,
    String? about,
    int? appointmentDuration,
    int? bufferTime,
    String? image,
  }) = _DoctorProfile;

  factory DoctorProfile.fromJson(Map<String, dynamic> json) => _$DoctorProfileFromJson(json);
}

@freezed
abstract class TimeSlot with _$TimeSlot {
  const factory TimeSlot({
    required String startTime,
    required String endTime,
  }) = _TimeSlot;

  factory TimeSlot.fromJson(Map<String, dynamic> json) => _$TimeSlotFromJson(json);
}

@freezed
abstract class DoctorSchedule with _$DoctorSchedule {
  const factory DoctorSchedule({
    String? doctorId,
    required Map<String, List<TimeSlot>> availability,
  }) = _DoctorSchedule;

  factory DoctorSchedule.fromJson(Map<String, dynamic> json) => _$DoctorScheduleFromJson(json);
}

@freezed
abstract class Appointment with _$Appointment {
  const factory Appointment({
    required String id,
    required String doctorId,
    String? patientId,
    String? patientName,
    String? patientImage,
    required String date,
    required String startTime,
    required String endTime,
    @Default(0) int status, // 0 = Booked, 1 = Completed, 2 = Cancelled
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);
}

@freezed
abstract class Payment with _$Payment {
  const factory Payment({
    String? id,
    required String patientId,
    required String appointmentId,
    required double amount,
    String? date,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);
}

@freezed
abstract class DailyBreakdown with _$DailyBreakdown {
  const factory DailyBreakdown({
    required String date,
    required double total,
  }) = _DailyBreakdown;

  factory DailyBreakdown.fromJson(Map<String, dynamic> json) => _$DailyBreakdownFromJson(json);
}

@freezed
abstract class RevenueData with _$RevenueData {
  const factory RevenueData({
    @Default(0.0) double totalEarnings,
    @Default(0) int totalPayments,
    @Default([]) List<DailyBreakdown> dailyBreakdown,
  }) = _RevenueData;

  factory RevenueData.fromJson(Map<String, dynamic> json) => _$RevenueDataFromJson(json);
}

@freezed
abstract class SystemNotification with _$SystemNotification {
  const factory SystemNotification({
    required String id,
    required String message,
    @Default(false) bool read,
    String? date,
  }) = _SystemNotification;

  factory SystemNotification.fromJson(Map<String, dynamic> json) => _$SystemNotificationFromJson(json);
}
