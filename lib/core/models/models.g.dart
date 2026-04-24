// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DoctorProfile _$DoctorProfileFromJson(Map<String, dynamic> json) =>
    _DoctorProfile(
      id: json['id'] as String?,
      name: json['name'] as String?,
      city: json['city'] as String?,
      about: json['about'] as String?,
      appointmentDuration: (json['appointmentDuration'] as num?)?.toInt(),
      bufferTime: (json['bufferTime'] as num?)?.toInt(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$DoctorProfileToJson(_DoctorProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'about': instance.about,
      'appointmentDuration': instance.appointmentDuration,
      'bufferTime': instance.bufferTime,
      'image': instance.image,
    };

_TimeSlot _$TimeSlotFromJson(Map<String, dynamic> json) => _TimeSlot(
  startTime: json['startTime'] as String,
  endTime: json['endTime'] as String,
);

Map<String, dynamic> _$TimeSlotToJson(_TimeSlot instance) => <String, dynamic>{
  'startTime': instance.startTime,
  'endTime': instance.endTime,
};

_DoctorSchedule _$DoctorScheduleFromJson(Map<String, dynamic> json) =>
    _DoctorSchedule(
      doctorId: json['doctorId'] as String?,
      availability: (json['availability'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          k,
          (e as List<dynamic>)
              .map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ),
    );

Map<String, dynamic> _$DoctorScheduleToJson(_DoctorSchedule instance) =>
    <String, dynamic>{
      'doctorId': instance.doctorId,
      'availability': instance.availability,
    };

_Appointment _$AppointmentFromJson(Map<String, dynamic> json) => _Appointment(
  id: json['id'] as String,
  doctorId: json['doctorId'] as String,
  patientId: json['patientId'] as String?,
  patientName: json['patientName'] as String?,
  patientImage: json['patientImage'] as String?,
  date: json['date'] as String,
  startTime: json['startTime'] as String,
  endTime: json['endTime'] as String,
  status: (json['status'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$AppointmentToJson(_Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctorId': instance.doctorId,
      'patientId': instance.patientId,
      'patientName': instance.patientName,
      'patientImage': instance.patientImage,
      'date': instance.date,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'status': instance.status,
    };

_Payment _$PaymentFromJson(Map<String, dynamic> json) => _Payment(
  id: json['id'] as String?,
  patientId: json['patientId'] as String,
  appointmentId: json['appointmentId'] as String,
  amount: (json['amount'] as num).toDouble(),
  date: json['date'] as String?,
);

Map<String, dynamic> _$PaymentToJson(_Payment instance) => <String, dynamic>{
  'id': instance.id,
  'patientId': instance.patientId,
  'appointmentId': instance.appointmentId,
  'amount': instance.amount,
  'date': instance.date,
};

_DailyBreakdown _$DailyBreakdownFromJson(Map<String, dynamic> json) =>
    _DailyBreakdown(
      date: json['date'] as String,
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$DailyBreakdownToJson(_DailyBreakdown instance) =>
    <String, dynamic>{'date': instance.date, 'total': instance.total};

_RevenueData _$RevenueDataFromJson(Map<String, dynamic> json) => _RevenueData(
  totalEarnings: (json['totalEarnings'] as num?)?.toDouble() ?? 0.0,
  totalPayments: (json['totalPayments'] as num?)?.toInt() ?? 0,
  dailyBreakdown:
      (json['dailyBreakdown'] as List<dynamic>?)
          ?.map((e) => DailyBreakdown.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$RevenueDataToJson(_RevenueData instance) =>
    <String, dynamic>{
      'totalEarnings': instance.totalEarnings,
      'totalPayments': instance.totalPayments,
      'dailyBreakdown': instance.dailyBreakdown,
    };

_SystemNotification _$SystemNotificationFromJson(Map<String, dynamic> json) =>
    _SystemNotification(
      id: json['id'] as String,
      message: json['message'] as String,
      read: json['read'] as bool? ?? false,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$SystemNotificationToJson(_SystemNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'read': instance.read,
      'date': instance.date,
    };
