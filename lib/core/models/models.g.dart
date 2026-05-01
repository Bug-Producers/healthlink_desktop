// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorProfileImpl _$$DoctorProfileImplFromJson(Map<String, dynamic> json) =>
    _$DoctorProfileImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      hospitalOrClinicName: json['hospitalOrClinicName'] as String?,
      about: json['about'] as String?,
      appointmentDuration: (json['appointmentDuration'] as num?)?.toInt(),
      bufferTime: (json['bufferTime'] as num?)?.toInt(),
      image: json['image'] as String?,
      department: json['department'] as String?,
      expYears: (json['expYears'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DoctorProfileImplToJson(_$DoctorProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'country': instance.country,
      'hospitalOrClinicName': instance.hospitalOrClinicName,
      'about': instance.about,
      'appointmentDuration': instance.appointmentDuration,
      'bufferTime': instance.bufferTime,
      'image': instance.image,
      'department': instance.department,
      'expYears': instance.expYears,
    };

_$DoctorRegistrationImpl _$$DoctorRegistrationImplFromJson(
        Map<String, dynamic> json) =>
    _$DoctorRegistrationImpl(
      name: json['name'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      hospitalOrClinicName: json['hospitalOrClinicName'] as String,
      about: json['about'] as String,
      appointmentDuration: (json['appointmentDuration'] as num).toInt(),
      bufferTime: (json['bufferTime'] as num).toInt(),
      department: Map<String, String>.from(json['department'] as Map),
      expYears: (json['expYears'] as num).toInt(),
    );

Map<String, dynamic> _$$DoctorRegistrationImplToJson(
        _$DoctorRegistrationImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'city': instance.city,
      'country': instance.country,
      'hospitalOrClinicName': instance.hospitalOrClinicName,
      'about': instance.about,
      'appointmentDuration': instance.appointmentDuration,
      'bufferTime': instance.bufferTime,
      'department': instance.department,
      'expYears': instance.expYears,
    };

_$TimeSlotImpl _$$TimeSlotImplFromJson(Map<String, dynamic> json) =>
    _$TimeSlotImpl(
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
    );

Map<String, dynamic> _$$TimeSlotImplToJson(_$TimeSlotImpl instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };

_$DoctorScheduleImpl _$$DoctorScheduleImplFromJson(Map<String, dynamic> json) =>
    _$DoctorScheduleImpl(
      doctorId: json['doctorId'] as String?,
      availability: (json['availability'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$$DoctorScheduleImplToJson(
        _$DoctorScheduleImpl instance) =>
    <String, dynamic>{
      'doctorId': instance.doctorId,
      'availability': instance.availability,
    };

_$AppointmentImpl _$$AppointmentImplFromJson(Map<String, dynamic> json) =>
    _$AppointmentImpl(
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

Map<String, dynamic> _$$AppointmentImplToJson(_$AppointmentImpl instance) =>
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

_$PaymentImpl _$$PaymentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentImpl(
      id: json['id'] as String?,
      patientId: json['patientId'] as String,
      appointmentId: json['appointmentId'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: json['date'] as String?,
    );

Map<String, dynamic> _$$PaymentImplToJson(_$PaymentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'appointmentId': instance.appointmentId,
      'amount': instance.amount,
      'date': instance.date,
    };

_$DailyBreakdownImpl _$$DailyBreakdownImplFromJson(Map<String, dynamic> json) =>
    _$DailyBreakdownImpl(
      date: json['date'] as String,
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$$DailyBreakdownImplToJson(
        _$DailyBreakdownImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'total': instance.total,
    };

_$RevenueDataImpl _$$RevenueDataImplFromJson(Map<String, dynamic> json) =>
    _$RevenueDataImpl(
      totalEarnings: (json['totalEarnings'] as num?)?.toDouble() ?? 0.0,
      totalPayments: (json['totalPayments'] as num?)?.toInt() ?? 0,
      dailyBreakdown: (json['dailyBreakdown'] as List<dynamic>?)
              ?.map((e) => DailyBreakdown.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RevenueDataImplToJson(_$RevenueDataImpl instance) =>
    <String, dynamic>{
      'totalEarnings': instance.totalEarnings,
      'totalPayments': instance.totalPayments,
      'dailyBreakdown': instance.dailyBreakdown,
    };

_$SystemNotificationImpl _$$SystemNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$SystemNotificationImpl(
      id: json['id'] as String,
      message: json['message'] as String,
      read: json['read'] as bool? ?? false,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$$SystemNotificationImplToJson(
        _$SystemNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'read': instance.read,
      'date': instance.date,
    };

_$RatingImpl _$$RatingImplFromJson(Map<String, dynamic> json) => _$RatingImpl(
      id: json['id'] as String?,
      patientName: json['patientName'] as String?,
      patientId: json['patientId'] as String?,
      stars: (json['stars'] as num?)?.toInt() ?? 5,
      comment: json['comment'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$$RatingImplToJson(_$RatingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientName': instance.patientName,
      'patientId': instance.patientId,
      'stars': instance.stars,
      'comment': instance.comment,
      'date': instance.date,
    };

_$RatingsDataImpl _$$RatingsDataImplFromJson(Map<String, dynamic> json) =>
    _$RatingsDataImpl(
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
      totalRatings: (json['totalRatings'] as num?)?.toInt() ?? 0,
      ratings: (json['ratings'] as List<dynamic>?)
              ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RatingsDataImplToJson(_$RatingsDataImpl instance) =>
    <String, dynamic>{
      'averageRating': instance.averageRating,
      'totalRatings': instance.totalRatings,
      'ratings': instance.ratings,
    };

_$PatientHistoryImpl _$$PatientHistoryImplFromJson(Map<String, dynamic> json) =>
    _$PatientHistoryImpl(
      id: json['id'] as String?,
      patientId: json['patientId'] as String?,
      report: json['report'] as String,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$$PatientHistoryImplToJson(
        _$PatientHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'report': instance.report,
      'date': instance.date,
    };

_$PatientInfoImpl _$$PatientInfoImplFromJson(Map<String, dynamic> json) =>
    _$PatientInfoImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$PatientInfoImplToJson(_$PatientInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
