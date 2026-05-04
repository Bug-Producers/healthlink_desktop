// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DoctorProfile _$DoctorProfileFromJson(Map<String, dynamic> json) {
  return _DoctorProfile.fromJson(json);
}

/// @nodoc
mixin _$DoctorProfile {
  @JsonKey(name: 'uuid')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get hospitalOrClinicName => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  @JsonKey(name: 'profileImage')
  String? get image => throw _privateConstructorUsedError;
  Map<String, dynamic>? get department => throw _privateConstructorUsedError;
  int? get expYears => throw _privateConstructorUsedError;

  /// Serializes this DoctorProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorProfileCopyWith<DoctorProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorProfileCopyWith<$Res> {
  factory $DoctorProfileCopyWith(
          DoctorProfile value, $Res Function(DoctorProfile) then) =
      _$DoctorProfileCopyWithImpl<$Res, DoctorProfile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'uuid') String? id,
      String? name,
      String? city,
      String? country,
      String? hospitalOrClinicName,
      String? about,
      @JsonKey(name: 'profileImage') String? image,
      Map<String, dynamic>? department,
      int? expYears});
}

/// @nodoc
class _$DoctorProfileCopyWithImpl<$Res, $Val extends DoctorProfile>
    implements $DoctorProfileCopyWith<$Res> {
  _$DoctorProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? hospitalOrClinicName = freezed,
    Object? about = freezed,
    Object? image = freezed,
    Object? department = freezed,
    Object? expYears = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalOrClinicName: freezed == hospitalOrClinicName
          ? _value.hospitalOrClinicName
          : hospitalOrClinicName // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      expYears: freezed == expYears
          ? _value.expYears
          : expYears // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorProfileImplCopyWith<$Res>
    implements $DoctorProfileCopyWith<$Res> {
  factory _$$DoctorProfileImplCopyWith(
          _$DoctorProfileImpl value, $Res Function(_$DoctorProfileImpl) then) =
      __$$DoctorProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'uuid') String? id,
      String? name,
      String? city,
      String? country,
      String? hospitalOrClinicName,
      String? about,
      @JsonKey(name: 'profileImage') String? image,
      Map<String, dynamic>? department,
      int? expYears});
}

/// @nodoc
class __$$DoctorProfileImplCopyWithImpl<$Res>
    extends _$DoctorProfileCopyWithImpl<$Res, _$DoctorProfileImpl>
    implements _$$DoctorProfileImplCopyWith<$Res> {
  __$$DoctorProfileImplCopyWithImpl(
      _$DoctorProfileImpl _value, $Res Function(_$DoctorProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? hospitalOrClinicName = freezed,
    Object? about = freezed,
    Object? image = freezed,
    Object? department = freezed,
    Object? expYears = freezed,
  }) {
    return _then(_$DoctorProfileImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalOrClinicName: freezed == hospitalOrClinicName
          ? _value.hospitalOrClinicName
          : hospitalOrClinicName // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value._department
          : department // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      expYears: freezed == expYears
          ? _value.expYears
          : expYears // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorProfileImpl implements _DoctorProfile {
  const _$DoctorProfileImpl(
      {@JsonKey(name: 'uuid') this.id,
      this.name,
      this.city,
      this.country,
      this.hospitalOrClinicName,
      this.about,
      @JsonKey(name: 'profileImage') this.image,
      final Map<String, dynamic>? department,
      this.expYears})
      : _department = department;

  factory _$DoctorProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorProfileImplFromJson(json);

  @override
  @JsonKey(name: 'uuid')
  final String? id;
  @override
  final String? name;
  @override
  final String? city;
  @override
  final String? country;
  @override
  final String? hospitalOrClinicName;
  @override
  final String? about;
  @override
  @JsonKey(name: 'profileImage')
  final String? image;
  final Map<String, dynamic>? _department;
  @override
  Map<String, dynamic>? get department {
    final value = _department;
    if (value == null) return null;
    if (_department is EqualUnmodifiableMapView) return _department;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final int? expYears;

  @override
  String toString() {
    return 'DoctorProfile(id: $id, name: $name, city: $city, country: $country, hospitalOrClinicName: $hospitalOrClinicName, about: $about, image: $image, department: $department, expYears: $expYears)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.hospitalOrClinicName, hospitalOrClinicName) ||
                other.hospitalOrClinicName == hospitalOrClinicName) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other._department, _department) &&
            (identical(other.expYears, expYears) ||
                other.expYears == expYears));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      city,
      country,
      hospitalOrClinicName,
      about,
      image,
      const DeepCollectionEquality().hash(_department),
      expYears);

  /// Create a copy of DoctorProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorProfileImplCopyWith<_$DoctorProfileImpl> get copyWith =>
      __$$DoctorProfileImplCopyWithImpl<_$DoctorProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorProfileImplToJson(
      this,
    );
  }
}

abstract class _DoctorProfile implements DoctorProfile {
  const factory _DoctorProfile(
      {@JsonKey(name: 'uuid') final String? id,
      final String? name,
      final String? city,
      final String? country,
      final String? hospitalOrClinicName,
      final String? about,
      @JsonKey(name: 'profileImage') final String? image,
      final Map<String, dynamic>? department,
      final int? expYears}) = _$DoctorProfileImpl;

  factory _DoctorProfile.fromJson(Map<String, dynamic> json) =
      _$DoctorProfileImpl.fromJson;

  @override
  @JsonKey(name: 'uuid')
  String? get id;
  @override
  String? get name;
  @override
  String? get city;
  @override
  String? get country;
  @override
  String? get hospitalOrClinicName;
  @override
  String? get about;
  @override
  @JsonKey(name: 'profileImage')
  String? get image;
  @override
  Map<String, dynamic>? get department;
  @override
  int? get expYears;

  /// Create a copy of DoctorProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorProfileImplCopyWith<_$DoctorProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoctorRegistration _$DoctorRegistrationFromJson(Map<String, dynamic> json) {
  return _DoctorRegistration.fromJson(json);
}

/// @nodoc
mixin _$DoctorRegistration {
  String get name => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get hospitalOrClinicName => throw _privateConstructorUsedError;
  String get about => throw _privateConstructorUsedError;
  int get appointmentDuration => throw _privateConstructorUsedError;
  int get bufferTime => throw _privateConstructorUsedError;
  Map<String, String> get department => throw _privateConstructorUsedError;
  int get expYears => throw _privateConstructorUsedError;

  /// Serializes this DoctorRegistration to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorRegistration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorRegistrationCopyWith<DoctorRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorRegistrationCopyWith<$Res> {
  factory $DoctorRegistrationCopyWith(
          DoctorRegistration value, $Res Function(DoctorRegistration) then) =
      _$DoctorRegistrationCopyWithImpl<$Res, DoctorRegistration>;
  @useResult
  $Res call(
      {String name,
      String city,
      String country,
      String hospitalOrClinicName,
      String about,
      int appointmentDuration,
      int bufferTime,
      Map<String, String> department,
      int expYears});
}

/// @nodoc
class _$DoctorRegistrationCopyWithImpl<$Res, $Val extends DoctorRegistration>
    implements $DoctorRegistrationCopyWith<$Res> {
  _$DoctorRegistrationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorRegistration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? city = null,
    Object? country = null,
    Object? hospitalOrClinicName = null,
    Object? about = null,
    Object? appointmentDuration = null,
    Object? bufferTime = null,
    Object? department = null,
    Object? expYears = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      hospitalOrClinicName: null == hospitalOrClinicName
          ? _value.hospitalOrClinicName
          : hospitalOrClinicName // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentDuration: null == appointmentDuration
          ? _value.appointmentDuration
          : appointmentDuration // ignore: cast_nullable_to_non_nullable
              as int,
      bufferTime: null == bufferTime
          ? _value.bufferTime
          : bufferTime // ignore: cast_nullable_to_non_nullable
              as int,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      expYears: null == expYears
          ? _value.expYears
          : expYears // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorRegistrationImplCopyWith<$Res>
    implements $DoctorRegistrationCopyWith<$Res> {
  factory _$$DoctorRegistrationImplCopyWith(_$DoctorRegistrationImpl value,
          $Res Function(_$DoctorRegistrationImpl) then) =
      __$$DoctorRegistrationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String city,
      String country,
      String hospitalOrClinicName,
      String about,
      int appointmentDuration,
      int bufferTime,
      Map<String, String> department,
      int expYears});
}

/// @nodoc
class __$$DoctorRegistrationImplCopyWithImpl<$Res>
    extends _$DoctorRegistrationCopyWithImpl<$Res, _$DoctorRegistrationImpl>
    implements _$$DoctorRegistrationImplCopyWith<$Res> {
  __$$DoctorRegistrationImplCopyWithImpl(_$DoctorRegistrationImpl _value,
      $Res Function(_$DoctorRegistrationImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorRegistration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? city = null,
    Object? country = null,
    Object? hospitalOrClinicName = null,
    Object? about = null,
    Object? appointmentDuration = null,
    Object? bufferTime = null,
    Object? department = null,
    Object? expYears = null,
  }) {
    return _then(_$DoctorRegistrationImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      hospitalOrClinicName: null == hospitalOrClinicName
          ? _value.hospitalOrClinicName
          : hospitalOrClinicName // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentDuration: null == appointmentDuration
          ? _value.appointmentDuration
          : appointmentDuration // ignore: cast_nullable_to_non_nullable
              as int,
      bufferTime: null == bufferTime
          ? _value.bufferTime
          : bufferTime // ignore: cast_nullable_to_non_nullable
              as int,
      department: null == department
          ? _value._department
          : department // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      expYears: null == expYears
          ? _value.expYears
          : expYears // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorRegistrationImpl implements _DoctorRegistration {
  const _$DoctorRegistrationImpl(
      {required this.name,
      required this.city,
      required this.country,
      required this.hospitalOrClinicName,
      required this.about,
      required this.appointmentDuration,
      required this.bufferTime,
      required final Map<String, String> department,
      required this.expYears})
      : _department = department;

  factory _$DoctorRegistrationImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorRegistrationImplFromJson(json);

  @override
  final String name;
  @override
  final String city;
  @override
  final String country;
  @override
  final String hospitalOrClinicName;
  @override
  final String about;
  @override
  final int appointmentDuration;
  @override
  final int bufferTime;
  final Map<String, String> _department;
  @override
  Map<String, String> get department {
    if (_department is EqualUnmodifiableMapView) return _department;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_department);
  }

  @override
  final int expYears;

  @override
  String toString() {
    return 'DoctorRegistration(name: $name, city: $city, country: $country, hospitalOrClinicName: $hospitalOrClinicName, about: $about, appointmentDuration: $appointmentDuration, bufferTime: $bufferTime, department: $department, expYears: $expYears)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorRegistrationImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.hospitalOrClinicName, hospitalOrClinicName) ||
                other.hospitalOrClinicName == hospitalOrClinicName) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.appointmentDuration, appointmentDuration) ||
                other.appointmentDuration == appointmentDuration) &&
            (identical(other.bufferTime, bufferTime) ||
                other.bufferTime == bufferTime) &&
            const DeepCollectionEquality()
                .equals(other._department, _department) &&
            (identical(other.expYears, expYears) ||
                other.expYears == expYears));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      city,
      country,
      hospitalOrClinicName,
      about,
      appointmentDuration,
      bufferTime,
      const DeepCollectionEquality().hash(_department),
      expYears);

  /// Create a copy of DoctorRegistration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorRegistrationImplCopyWith<_$DoctorRegistrationImpl> get copyWith =>
      __$$DoctorRegistrationImplCopyWithImpl<_$DoctorRegistrationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorRegistrationImplToJson(
      this,
    );
  }
}

abstract class _DoctorRegistration implements DoctorRegistration {
  const factory _DoctorRegistration(
      {required final String name,
      required final String city,
      required final String country,
      required final String hospitalOrClinicName,
      required final String about,
      required final int appointmentDuration,
      required final int bufferTime,
      required final Map<String, String> department,
      required final int expYears}) = _$DoctorRegistrationImpl;

  factory _DoctorRegistration.fromJson(Map<String, dynamic> json) =
      _$DoctorRegistrationImpl.fromJson;

  @override
  String get name;
  @override
  String get city;
  @override
  String get country;
  @override
  String get hospitalOrClinicName;
  @override
  String get about;
  @override
  int get appointmentDuration;
  @override
  int get bufferTime;
  @override
  Map<String, String> get department;
  @override
  int get expYears;

  /// Create a copy of DoctorRegistration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorRegistrationImplCopyWith<_$DoctorRegistrationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeSlot _$TimeSlotFromJson(Map<String, dynamic> json) {
  return _TimeSlot.fromJson(json);
}

/// @nodoc
mixin _$TimeSlot {
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;

  /// Serializes this TimeSlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeSlotCopyWith<TimeSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSlotCopyWith<$Res> {
  factory $TimeSlotCopyWith(TimeSlot value, $Res Function(TimeSlot) then) =
      _$TimeSlotCopyWithImpl<$Res, TimeSlot>;
  @useResult
  $Res call({String startTime, String endTime});
}

/// @nodoc
class _$TimeSlotCopyWithImpl<$Res, $Val extends TimeSlot>
    implements $TimeSlotCopyWith<$Res> {
  _$TimeSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_value.copyWith(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeSlotImplCopyWith<$Res>
    implements $TimeSlotCopyWith<$Res> {
  factory _$$TimeSlotImplCopyWith(
          _$TimeSlotImpl value, $Res Function(_$TimeSlotImpl) then) =
      __$$TimeSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String startTime, String endTime});
}

/// @nodoc
class __$$TimeSlotImplCopyWithImpl<$Res>
    extends _$TimeSlotCopyWithImpl<$Res, _$TimeSlotImpl>
    implements _$$TimeSlotImplCopyWith<$Res> {
  __$$TimeSlotImplCopyWithImpl(
      _$TimeSlotImpl _value, $Res Function(_$TimeSlotImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_$TimeSlotImpl(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeSlotImpl implements _TimeSlot {
  const _$TimeSlotImpl({required this.startTime, required this.endTime});

  factory _$TimeSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeSlotImplFromJson(json);

  @override
  final String startTime;
  @override
  final String endTime;

  @override
  String toString() {
    return 'TimeSlot(startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeSlotImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startTime, endTime);

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeSlotImplCopyWith<_$TimeSlotImpl> get copyWith =>
      __$$TimeSlotImplCopyWithImpl<_$TimeSlotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeSlotImplToJson(
      this,
    );
  }
}

abstract class _TimeSlot implements TimeSlot {
  const factory _TimeSlot(
      {required final String startTime,
      required final String endTime}) = _$TimeSlotImpl;

  factory _TimeSlot.fromJson(Map<String, dynamic> json) =
      _$TimeSlotImpl.fromJson;

  @override
  String get startTime;
  @override
  String get endTime;

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeSlotImplCopyWith<_$TimeSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoctorSchedule _$DoctorScheduleFromJson(Map<String, dynamic> json) {
  return _DoctorSchedule.fromJson(json);
}

/// @nodoc
mixin _$DoctorSchedule {
  String? get doctorId => throw _privateConstructorUsedError;
  int get appointmentDuration => throw _privateConstructorUsedError;
  int get bufferTime => throw _privateConstructorUsedError;
  Map<String, List<TimeSlot>> get availability =>
      throw _privateConstructorUsedError;

  /// Serializes this DoctorSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorScheduleCopyWith<DoctorSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorScheduleCopyWith<$Res> {
  factory $DoctorScheduleCopyWith(
          DoctorSchedule value, $Res Function(DoctorSchedule) then) =
      _$DoctorScheduleCopyWithImpl<$Res, DoctorSchedule>;
  @useResult
  $Res call(
      {String? doctorId,
      int appointmentDuration,
      int bufferTime,
      Map<String, List<TimeSlot>> availability});
}

/// @nodoc
class _$DoctorScheduleCopyWithImpl<$Res, $Val extends DoctorSchedule>
    implements $DoctorScheduleCopyWith<$Res> {
  _$DoctorScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = freezed,
    Object? appointmentDuration = null,
    Object? bufferTime = null,
    Object? availability = null,
  }) {
    return _then(_value.copyWith(
      doctorId: freezed == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String?,
      appointmentDuration: null == appointmentDuration
          ? _value.appointmentDuration
          : appointmentDuration // ignore: cast_nullable_to_non_nullable
              as int,
      bufferTime: null == bufferTime
          ? _value.bufferTime
          : bufferTime // ignore: cast_nullable_to_non_nullable
              as int,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as Map<String, List<TimeSlot>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorScheduleImplCopyWith<$Res>
    implements $DoctorScheduleCopyWith<$Res> {
  factory _$$DoctorScheduleImplCopyWith(_$DoctorScheduleImpl value,
          $Res Function(_$DoctorScheduleImpl) then) =
      __$$DoctorScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? doctorId,
      int appointmentDuration,
      int bufferTime,
      Map<String, List<TimeSlot>> availability});
}

/// @nodoc
class __$$DoctorScheduleImplCopyWithImpl<$Res>
    extends _$DoctorScheduleCopyWithImpl<$Res, _$DoctorScheduleImpl>
    implements _$$DoctorScheduleImplCopyWith<$Res> {
  __$$DoctorScheduleImplCopyWithImpl(
      _$DoctorScheduleImpl _value, $Res Function(_$DoctorScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = freezed,
    Object? appointmentDuration = null,
    Object? bufferTime = null,
    Object? availability = null,
  }) {
    return _then(_$DoctorScheduleImpl(
      doctorId: freezed == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String?,
      appointmentDuration: null == appointmentDuration
          ? _value.appointmentDuration
          : appointmentDuration // ignore: cast_nullable_to_non_nullable
              as int,
      bufferTime: null == bufferTime
          ? _value.bufferTime
          : bufferTime // ignore: cast_nullable_to_non_nullable
              as int,
      availability: null == availability
          ? _value._availability
          : availability // ignore: cast_nullable_to_non_nullable
              as Map<String, List<TimeSlot>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorScheduleImpl implements _DoctorSchedule {
  const _$DoctorScheduleImpl(
      {this.doctorId,
      this.appointmentDuration = 30,
      this.bufferTime = 10,
      final Map<String, List<TimeSlot>> availability = const {}})
      : _availability = availability;

  factory _$DoctorScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorScheduleImplFromJson(json);

  @override
  final String? doctorId;
  @override
  @JsonKey()
  final int appointmentDuration;
  @override
  @JsonKey()
  final int bufferTime;
  final Map<String, List<TimeSlot>> _availability;
  @override
  @JsonKey()
  Map<String, List<TimeSlot>> get availability {
    if (_availability is EqualUnmodifiableMapView) return _availability;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_availability);
  }

  @override
  String toString() {
    return 'DoctorSchedule(doctorId: $doctorId, appointmentDuration: $appointmentDuration, bufferTime: $bufferTime, availability: $availability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorScheduleImpl &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.appointmentDuration, appointmentDuration) ||
                other.appointmentDuration == appointmentDuration) &&
            (identical(other.bufferTime, bufferTime) ||
                other.bufferTime == bufferTime) &&
            const DeepCollectionEquality()
                .equals(other._availability, _availability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, doctorId, appointmentDuration,
      bufferTime, const DeepCollectionEquality().hash(_availability));

  /// Create a copy of DoctorSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorScheduleImplCopyWith<_$DoctorScheduleImpl> get copyWith =>
      __$$DoctorScheduleImplCopyWithImpl<_$DoctorScheduleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorScheduleImplToJson(
      this,
    );
  }
}

abstract class _DoctorSchedule implements DoctorSchedule {
  const factory _DoctorSchedule(
      {final String? doctorId,
      final int appointmentDuration,
      final int bufferTime,
      final Map<String, List<TimeSlot>> availability}) = _$DoctorScheduleImpl;

  factory _DoctorSchedule.fromJson(Map<String, dynamic> json) =
      _$DoctorScheduleImpl.fromJson;

  @override
  String? get doctorId;
  @override
  int get appointmentDuration;
  @override
  int get bufferTime;
  @override
  Map<String, List<TimeSlot>> get availability;

  /// Create a copy of DoctorSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorScheduleImplCopyWith<_$DoctorScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Appointment _$AppointmentFromJson(Map<String, dynamic> json) {
  return _Appointment.fromJson(json);
}

/// @nodoc
mixin _$Appointment {
  String get id => throw _privateConstructorUsedError;
  String get doctorId => throw _privateConstructorUsedError;
  String? get patientId => throw _privateConstructorUsedError;
  String? get patientName => throw _privateConstructorUsedError;
  String? get patientImage => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  /// Serializes this Appointment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentCopyWith<Appointment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentCopyWith<$Res> {
  factory $AppointmentCopyWith(
          Appointment value, $Res Function(Appointment) then) =
      _$AppointmentCopyWithImpl<$Res, Appointment>;
  @useResult
  $Res call(
      {String id,
      String doctorId,
      String? patientId,
      String? patientName,
      String? patientImage,
      String date,
      String startTime,
      String endTime,
      int status});
}

/// @nodoc
class _$AppointmentCopyWithImpl<$Res, $Val extends Appointment>
    implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? doctorId = null,
    Object? patientId = freezed,
    Object? patientName = freezed,
    Object? patientImage = freezed,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      patientName: freezed == patientName
          ? _value.patientName
          : patientName // ignore: cast_nullable_to_non_nullable
              as String?,
      patientImage: freezed == patientImage
          ? _value.patientImage
          : patientImage // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppointmentImplCopyWith<$Res>
    implements $AppointmentCopyWith<$Res> {
  factory _$$AppointmentImplCopyWith(
          _$AppointmentImpl value, $Res Function(_$AppointmentImpl) then) =
      __$$AppointmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String doctorId,
      String? patientId,
      String? patientName,
      String? patientImage,
      String date,
      String startTime,
      String endTime,
      int status});
}

/// @nodoc
class __$$AppointmentImplCopyWithImpl<$Res>
    extends _$AppointmentCopyWithImpl<$Res, _$AppointmentImpl>
    implements _$$AppointmentImplCopyWith<$Res> {
  __$$AppointmentImplCopyWithImpl(
      _$AppointmentImpl _value, $Res Function(_$AppointmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? doctorId = null,
    Object? patientId = freezed,
    Object? patientName = freezed,
    Object? patientImage = freezed,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? status = null,
  }) {
    return _then(_$AppointmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      patientName: freezed == patientName
          ? _value.patientName
          : patientName // ignore: cast_nullable_to_non_nullable
              as String?,
      patientImage: freezed == patientImage
          ? _value.patientImage
          : patientImage // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentImpl implements _Appointment {
  const _$AppointmentImpl(
      {this.id = '',
      this.doctorId = '',
      this.patientId,
      this.patientName,
      this.patientImage,
      this.date = '',
      this.startTime = '',
      this.endTime = '',
      this.status = 0});

  factory _$AppointmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String doctorId;
  @override
  final String? patientId;
  @override
  final String? patientName;
  @override
  final String? patientImage;
  @override
  @JsonKey()
  final String date;
  @override
  @JsonKey()
  final String startTime;
  @override
  @JsonKey()
  final String endTime;
  @override
  @JsonKey()
  final int status;

  @override
  String toString() {
    return 'Appointment(id: $id, doctorId: $doctorId, patientId: $patientId, patientName: $patientName, patientImage: $patientImage, date: $date, startTime: $startTime, endTime: $endTime, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.patientName, patientName) ||
                other.patientName == patientName) &&
            (identical(other.patientImage, patientImage) ||
                other.patientImage == patientImage) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, doctorId, patientId,
      patientName, patientImage, date, startTime, endTime, status);

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentImplCopyWith<_$AppointmentImpl> get copyWith =>
      __$$AppointmentImplCopyWithImpl<_$AppointmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentImplToJson(
      this,
    );
  }
}

abstract class _Appointment implements Appointment {
  const factory _Appointment(
      {final String id,
      final String doctorId,
      final String? patientId,
      final String? patientName,
      final String? patientImage,
      final String date,
      final String startTime,
      final String endTime,
      final int status}) = _$AppointmentImpl;

  factory _Appointment.fromJson(Map<String, dynamic> json) =
      _$AppointmentImpl.fromJson;

  @override
  String get id;
  @override
  String get doctorId;
  @override
  String? get patientId;
  @override
  String? get patientName;
  @override
  String? get patientImage;
  @override
  String get date;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  int get status;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentImplCopyWith<_$AppointmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
mixin _$Payment {
  String? get id => throw _privateConstructorUsedError;
  String get patientId => throw _privateConstructorUsedError;
  String get appointmentId => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res, Payment>;
  @useResult
  $Res call(
      {String? id,
      String patientId,
      String appointmentId,
      double? amount,
      String? date});
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res, $Val extends Payment>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? patientId = null,
    Object? appointmentId = null,
    Object? amount = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentId: null == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentImplCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$$PaymentImplCopyWith(
          _$PaymentImpl value, $Res Function(_$PaymentImpl) then) =
      __$$PaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String patientId,
      String appointmentId,
      double? amount,
      String? date});
}

/// @nodoc
class __$$PaymentImplCopyWithImpl<$Res>
    extends _$PaymentCopyWithImpl<$Res, _$PaymentImpl>
    implements _$$PaymentImplCopyWith<$Res> {
  __$$PaymentImplCopyWithImpl(
      _$PaymentImpl _value, $Res Function(_$PaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? patientId = null,
    Object? appointmentId = null,
    Object? amount = freezed,
    Object? date = freezed,
  }) {
    return _then(_$PaymentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentId: null == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentImpl implements _Payment {
  const _$PaymentImpl(
      {this.id,
      required this.patientId,
      required this.appointmentId,
      this.amount,
      this.date});

  factory _$PaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentImplFromJson(json);

  @override
  final String? id;
  @override
  final String patientId;
  @override
  final String appointmentId;
  @override
  final double? amount;
  @override
  final String? date;

  @override
  String toString() {
    return 'Payment(id: $id, patientId: $patientId, appointmentId: $appointmentId, amount: $amount, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, patientId, appointmentId, amount, date);

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      __$$PaymentImplCopyWithImpl<_$PaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentImplToJson(
      this,
    );
  }
}

abstract class _Payment implements Payment {
  const factory _Payment(
      {final String? id,
      required final String patientId,
      required final String appointmentId,
      final double? amount,
      final String? date}) = _$PaymentImpl;

  factory _Payment.fromJson(Map<String, dynamic> json) = _$PaymentImpl.fromJson;

  @override
  String? get id;
  @override
  String get patientId;
  @override
  String get appointmentId;
  @override
  double? get amount;
  @override
  String? get date;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyBreakdown _$DailyBreakdownFromJson(Map<String, dynamic> json) {
  return _DailyBreakdown.fromJson(json);
}

/// @nodoc
mixin _$DailyBreakdown {
  String get date => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;

  /// Serializes this DailyBreakdown to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyBreakdownCopyWith<DailyBreakdown> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyBreakdownCopyWith<$Res> {
  factory $DailyBreakdownCopyWith(
          DailyBreakdown value, $Res Function(DailyBreakdown) then) =
      _$DailyBreakdownCopyWithImpl<$Res, DailyBreakdown>;
  @useResult
  $Res call({String date, double? total});
}

/// @nodoc
class _$DailyBreakdownCopyWithImpl<$Res, $Val extends DailyBreakdown>
    implements $DailyBreakdownCopyWith<$Res> {
  _$DailyBreakdownCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyBreakdownImplCopyWith<$Res>
    implements $DailyBreakdownCopyWith<$Res> {
  factory _$$DailyBreakdownImplCopyWith(_$DailyBreakdownImpl value,
          $Res Function(_$DailyBreakdownImpl) then) =
      __$$DailyBreakdownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, double? total});
}

/// @nodoc
class __$$DailyBreakdownImplCopyWithImpl<$Res>
    extends _$DailyBreakdownCopyWithImpl<$Res, _$DailyBreakdownImpl>
    implements _$$DailyBreakdownImplCopyWith<$Res> {
  __$$DailyBreakdownImplCopyWithImpl(
      _$DailyBreakdownImpl _value, $Res Function(_$DailyBreakdownImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? total = freezed,
  }) {
    return _then(_$DailyBreakdownImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyBreakdownImpl implements _DailyBreakdown {
  const _$DailyBreakdownImpl({this.date = '', this.total});

  factory _$DailyBreakdownImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyBreakdownImplFromJson(json);

  @override
  @JsonKey()
  final String date;
  @override
  final double? total;

  @override
  String toString() {
    return 'DailyBreakdown(date: $date, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyBreakdownImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, total);

  /// Create a copy of DailyBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyBreakdownImplCopyWith<_$DailyBreakdownImpl> get copyWith =>
      __$$DailyBreakdownImplCopyWithImpl<_$DailyBreakdownImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyBreakdownImplToJson(
      this,
    );
  }
}

abstract class _DailyBreakdown implements DailyBreakdown {
  const factory _DailyBreakdown({final String date, final double? total}) =
      _$DailyBreakdownImpl;

  factory _DailyBreakdown.fromJson(Map<String, dynamic> json) =
      _$DailyBreakdownImpl.fromJson;

  @override
  String get date;
  @override
  double? get total;

  /// Create a copy of DailyBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyBreakdownImplCopyWith<_$DailyBreakdownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RevenueData _$RevenueDataFromJson(Map<String, dynamic> json) {
  return _RevenueData.fromJson(json);
}

/// @nodoc
mixin _$RevenueData {
  double? get totalEarnings => throw _privateConstructorUsedError;
  int? get totalPayments => throw _privateConstructorUsedError;
  List<DailyBreakdown>? get dailyBreakdown =>
      throw _privateConstructorUsedError;

  /// Serializes this RevenueData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RevenueData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RevenueDataCopyWith<RevenueData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RevenueDataCopyWith<$Res> {
  factory $RevenueDataCopyWith(
          RevenueData value, $Res Function(RevenueData) then) =
      _$RevenueDataCopyWithImpl<$Res, RevenueData>;
  @useResult
  $Res call(
      {double? totalEarnings,
      int? totalPayments,
      List<DailyBreakdown>? dailyBreakdown});
}

/// @nodoc
class _$RevenueDataCopyWithImpl<$Res, $Val extends RevenueData>
    implements $RevenueDataCopyWith<$Res> {
  _$RevenueDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RevenueData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalEarnings = freezed,
    Object? totalPayments = freezed,
    Object? dailyBreakdown = freezed,
  }) {
    return _then(_value.copyWith(
      totalEarnings: freezed == totalEarnings
          ? _value.totalEarnings
          : totalEarnings // ignore: cast_nullable_to_non_nullable
              as double?,
      totalPayments: freezed == totalPayments
          ? _value.totalPayments
          : totalPayments // ignore: cast_nullable_to_non_nullable
              as int?,
      dailyBreakdown: freezed == dailyBreakdown
          ? _value.dailyBreakdown
          : dailyBreakdown // ignore: cast_nullable_to_non_nullable
              as List<DailyBreakdown>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RevenueDataImplCopyWith<$Res>
    implements $RevenueDataCopyWith<$Res> {
  factory _$$RevenueDataImplCopyWith(
          _$RevenueDataImpl value, $Res Function(_$RevenueDataImpl) then) =
      __$$RevenueDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? totalEarnings,
      int? totalPayments,
      List<DailyBreakdown>? dailyBreakdown});
}

/// @nodoc
class __$$RevenueDataImplCopyWithImpl<$Res>
    extends _$RevenueDataCopyWithImpl<$Res, _$RevenueDataImpl>
    implements _$$RevenueDataImplCopyWith<$Res> {
  __$$RevenueDataImplCopyWithImpl(
      _$RevenueDataImpl _value, $Res Function(_$RevenueDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RevenueData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalEarnings = freezed,
    Object? totalPayments = freezed,
    Object? dailyBreakdown = freezed,
  }) {
    return _then(_$RevenueDataImpl(
      totalEarnings: freezed == totalEarnings
          ? _value.totalEarnings
          : totalEarnings // ignore: cast_nullable_to_non_nullable
              as double?,
      totalPayments: freezed == totalPayments
          ? _value.totalPayments
          : totalPayments // ignore: cast_nullable_to_non_nullable
              as int?,
      dailyBreakdown: freezed == dailyBreakdown
          ? _value._dailyBreakdown
          : dailyBreakdown // ignore: cast_nullable_to_non_nullable
              as List<DailyBreakdown>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RevenueDataImpl implements _RevenueData {
  const _$RevenueDataImpl(
      {this.totalEarnings = 0.0,
      this.totalPayments = 0,
      final List<DailyBreakdown>? dailyBreakdown = const []})
      : _dailyBreakdown = dailyBreakdown;

  factory _$RevenueDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RevenueDataImplFromJson(json);

  @override
  @JsonKey()
  final double? totalEarnings;
  @override
  @JsonKey()
  final int? totalPayments;
  final List<DailyBreakdown>? _dailyBreakdown;
  @override
  @JsonKey()
  List<DailyBreakdown>? get dailyBreakdown {
    final value = _dailyBreakdown;
    if (value == null) return null;
    if (_dailyBreakdown is EqualUnmodifiableListView) return _dailyBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RevenueData(totalEarnings: $totalEarnings, totalPayments: $totalPayments, dailyBreakdown: $dailyBreakdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RevenueDataImpl &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings) &&
            (identical(other.totalPayments, totalPayments) ||
                other.totalPayments == totalPayments) &&
            const DeepCollectionEquality()
                .equals(other._dailyBreakdown, _dailyBreakdown));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalEarnings, totalPayments,
      const DeepCollectionEquality().hash(_dailyBreakdown));

  /// Create a copy of RevenueData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RevenueDataImplCopyWith<_$RevenueDataImpl> get copyWith =>
      __$$RevenueDataImplCopyWithImpl<_$RevenueDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RevenueDataImplToJson(
      this,
    );
  }
}

abstract class _RevenueData implements RevenueData {
  const factory _RevenueData(
      {final double? totalEarnings,
      final int? totalPayments,
      final List<DailyBreakdown>? dailyBreakdown}) = _$RevenueDataImpl;

  factory _RevenueData.fromJson(Map<String, dynamic> json) =
      _$RevenueDataImpl.fromJson;

  @override
  double? get totalEarnings;
  @override
  int? get totalPayments;
  @override
  List<DailyBreakdown>? get dailyBreakdown;

  /// Create a copy of RevenueData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RevenueDataImplCopyWith<_$RevenueDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SystemNotification _$SystemNotificationFromJson(Map<String, dynamic> json) {
  return _SystemNotification.fromJson(json);
}

/// @nodoc
mixin _$SystemNotification {
  String get id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get read => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;

  /// Serializes this SystemNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SystemNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SystemNotificationCopyWith<SystemNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemNotificationCopyWith<$Res> {
  factory $SystemNotificationCopyWith(
          SystemNotification value, $Res Function(SystemNotification) then) =
      _$SystemNotificationCopyWithImpl<$Res, SystemNotification>;
  @useResult
  $Res call({String id, String message, bool read, String? date});
}

/// @nodoc
class _$SystemNotificationCopyWithImpl<$Res, $Val extends SystemNotification>
    implements $SystemNotificationCopyWith<$Res> {
  _$SystemNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SystemNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? read = null,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SystemNotificationImplCopyWith<$Res>
    implements $SystemNotificationCopyWith<$Res> {
  factory _$$SystemNotificationImplCopyWith(_$SystemNotificationImpl value,
          $Res Function(_$SystemNotificationImpl) then) =
      __$$SystemNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String message, bool read, String? date});
}

/// @nodoc
class __$$SystemNotificationImplCopyWithImpl<$Res>
    extends _$SystemNotificationCopyWithImpl<$Res, _$SystemNotificationImpl>
    implements _$$SystemNotificationImplCopyWith<$Res> {
  __$$SystemNotificationImplCopyWithImpl(_$SystemNotificationImpl _value,
      $Res Function(_$SystemNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of SystemNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? read = null,
    Object? date = freezed,
  }) {
    return _then(_$SystemNotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SystemNotificationImpl implements _SystemNotification {
  const _$SystemNotificationImpl(
      {this.id = '', this.message = '', this.read = false, this.date});

  factory _$SystemNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SystemNotificationImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final bool read;
  @override
  final String? date;

  @override
  String toString() {
    return 'SystemNotification(id: $id, message: $message, read: $read, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SystemNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.read, read) || other.read == read) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, message, read, date);

  /// Create a copy of SystemNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SystemNotificationImplCopyWith<_$SystemNotificationImpl> get copyWith =>
      __$$SystemNotificationImplCopyWithImpl<_$SystemNotificationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SystemNotificationImplToJson(
      this,
    );
  }
}

abstract class _SystemNotification implements SystemNotification {
  const factory _SystemNotification(
      {final String id,
      final String message,
      final bool read,
      final String? date}) = _$SystemNotificationImpl;

  factory _SystemNotification.fromJson(Map<String, dynamic> json) =
      _$SystemNotificationImpl.fromJson;

  @override
  String get id;
  @override
  String get message;
  @override
  bool get read;
  @override
  String? get date;

  /// Create a copy of SystemNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SystemNotificationImplCopyWith<_$SystemNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return _Rating.fromJson(json);
}

/// @nodoc
mixin _$Rating {
  String? get id => throw _privateConstructorUsedError;
  String? get patientName => throw _privateConstructorUsedError;
  String? get patientId => throw _privateConstructorUsedError;
  int get stars => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;

  /// Serializes this Rating to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatingCopyWith<Rating> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingCopyWith<$Res> {
  factory $RatingCopyWith(Rating value, $Res Function(Rating) then) =
      _$RatingCopyWithImpl<$Res, Rating>;
  @useResult
  $Res call(
      {String? id,
      String? patientName,
      String? patientId,
      int stars,
      String? comment,
      String? date});
}

/// @nodoc
class _$RatingCopyWithImpl<$Res, $Val extends Rating>
    implements $RatingCopyWith<$Res> {
  _$RatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? patientName = freezed,
    Object? patientId = freezed,
    Object? stars = null,
    Object? comment = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      patientName: freezed == patientName
          ? _value.patientName
          : patientName // ignore: cast_nullable_to_non_nullable
              as String?,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatingImplCopyWith<$Res> implements $RatingCopyWith<$Res> {
  factory _$$RatingImplCopyWith(
          _$RatingImpl value, $Res Function(_$RatingImpl) then) =
      __$$RatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? patientName,
      String? patientId,
      int stars,
      String? comment,
      String? date});
}

/// @nodoc
class __$$RatingImplCopyWithImpl<$Res>
    extends _$RatingCopyWithImpl<$Res, _$RatingImpl>
    implements _$$RatingImplCopyWith<$Res> {
  __$$RatingImplCopyWithImpl(
      _$RatingImpl _value, $Res Function(_$RatingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? patientName = freezed,
    Object? patientId = freezed,
    Object? stars = null,
    Object? comment = freezed,
    Object? date = freezed,
  }) {
    return _then(_$RatingImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      patientName: freezed == patientName
          ? _value.patientName
          : patientName // ignore: cast_nullable_to_non_nullable
              as String?,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatingImpl implements _Rating {
  const _$RatingImpl(
      {this.id,
      this.patientName,
      this.patientId,
      this.stars = 5,
      this.comment,
      this.date});

  factory _$RatingImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatingImplFromJson(json);

  @override
  final String? id;
  @override
  final String? patientName;
  @override
  final String? patientId;
  @override
  @JsonKey()
  final int stars;
  @override
  final String? comment;
  @override
  final String? date;

  @override
  String toString() {
    return 'Rating(id: $id, patientName: $patientName, patientId: $patientId, stars: $stars, comment: $comment, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.patientName, patientName) ||
                other.patientName == patientName) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.stars, stars) || other.stars == stars) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, patientName, patientId, stars, comment, date);

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingImplCopyWith<_$RatingImpl> get copyWith =>
      __$$RatingImplCopyWithImpl<_$RatingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatingImplToJson(
      this,
    );
  }
}

abstract class _Rating implements Rating {
  const factory _Rating(
      {final String? id,
      final String? patientName,
      final String? patientId,
      final int stars,
      final String? comment,
      final String? date}) = _$RatingImpl;

  factory _Rating.fromJson(Map<String, dynamic> json) = _$RatingImpl.fromJson;

  @override
  String? get id;
  @override
  String? get patientName;
  @override
  String? get patientId;
  @override
  int get stars;
  @override
  String? get comment;
  @override
  String? get date;

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatingImplCopyWith<_$RatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RatingsData _$RatingsDataFromJson(Map<String, dynamic> json) {
  return _RatingsData.fromJson(json);
}

/// @nodoc
mixin _$RatingsData {
  double? get averageRating => throw _privateConstructorUsedError;
  int? get totalRatings => throw _privateConstructorUsedError;
  List<Rating>? get ratings => throw _privateConstructorUsedError;

  /// Serializes this RatingsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RatingsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatingsDataCopyWith<RatingsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingsDataCopyWith<$Res> {
  factory $RatingsDataCopyWith(
          RatingsData value, $Res Function(RatingsData) then) =
      _$RatingsDataCopyWithImpl<$Res, RatingsData>;
  @useResult
  $Res call({double? averageRating, int? totalRatings, List<Rating>? ratings});
}

/// @nodoc
class _$RatingsDataCopyWithImpl<$Res, $Val extends RatingsData>
    implements $RatingsDataCopyWith<$Res> {
  _$RatingsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RatingsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageRating = freezed,
    Object? totalRatings = freezed,
    Object? ratings = freezed,
  }) {
    return _then(_value.copyWith(
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      totalRatings: freezed == totalRatings
          ? _value.totalRatings
          : totalRatings // ignore: cast_nullable_to_non_nullable
              as int?,
      ratings: freezed == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as List<Rating>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatingsDataImplCopyWith<$Res>
    implements $RatingsDataCopyWith<$Res> {
  factory _$$RatingsDataImplCopyWith(
          _$RatingsDataImpl value, $Res Function(_$RatingsDataImpl) then) =
      __$$RatingsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? averageRating, int? totalRatings, List<Rating>? ratings});
}

/// @nodoc
class __$$RatingsDataImplCopyWithImpl<$Res>
    extends _$RatingsDataCopyWithImpl<$Res, _$RatingsDataImpl>
    implements _$$RatingsDataImplCopyWith<$Res> {
  __$$RatingsDataImplCopyWithImpl(
      _$RatingsDataImpl _value, $Res Function(_$RatingsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RatingsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageRating = freezed,
    Object? totalRatings = freezed,
    Object? ratings = freezed,
  }) {
    return _then(_$RatingsDataImpl(
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      totalRatings: freezed == totalRatings
          ? _value.totalRatings
          : totalRatings // ignore: cast_nullable_to_non_nullable
              as int?,
      ratings: freezed == ratings
          ? _value._ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as List<Rating>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatingsDataImpl implements _RatingsData {
  const _$RatingsDataImpl(
      {this.averageRating = 0.0,
      this.totalRatings = 0,
      final List<Rating>? ratings = const []})
      : _ratings = ratings;

  factory _$RatingsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatingsDataImplFromJson(json);

  @override
  @JsonKey()
  final double? averageRating;
  @override
  @JsonKey()
  final int? totalRatings;
  final List<Rating>? _ratings;
  @override
  @JsonKey()
  List<Rating>? get ratings {
    final value = _ratings;
    if (value == null) return null;
    if (_ratings is EqualUnmodifiableListView) return _ratings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RatingsData(averageRating: $averageRating, totalRatings: $totalRatings, ratings: $ratings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingsDataImpl &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.totalRatings, totalRatings) ||
                other.totalRatings == totalRatings) &&
            const DeepCollectionEquality().equals(other._ratings, _ratings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, averageRating, totalRatings,
      const DeepCollectionEquality().hash(_ratings));

  /// Create a copy of RatingsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingsDataImplCopyWith<_$RatingsDataImpl> get copyWith =>
      __$$RatingsDataImplCopyWithImpl<_$RatingsDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatingsDataImplToJson(
      this,
    );
  }
}

abstract class _RatingsData implements RatingsData {
  const factory _RatingsData(
      {final double? averageRating,
      final int? totalRatings,
      final List<Rating>? ratings}) = _$RatingsDataImpl;

  factory _RatingsData.fromJson(Map<String, dynamic> json) =
      _$RatingsDataImpl.fromJson;

  @override
  double? get averageRating;
  @override
  int? get totalRatings;
  @override
  List<Rating>? get ratings;

  /// Create a copy of RatingsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatingsDataImplCopyWith<_$RatingsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientHistory _$PatientHistoryFromJson(Map<String, dynamic> json) {
  return _PatientHistory.fromJson(json);
}

/// @nodoc
mixin _$PatientHistory {
  String? get id => throw _privateConstructorUsedError;
  String? get patientId => throw _privateConstructorUsedError;
  String get report => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;

  /// Serializes this PatientHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientHistoryCopyWith<PatientHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientHistoryCopyWith<$Res> {
  factory $PatientHistoryCopyWith(
          PatientHistory value, $Res Function(PatientHistory) then) =
      _$PatientHistoryCopyWithImpl<$Res, PatientHistory>;
  @useResult
  $Res call({String? id, String? patientId, String report, String? date});
}

/// @nodoc
class _$PatientHistoryCopyWithImpl<$Res, $Val extends PatientHistory>
    implements $PatientHistoryCopyWith<$Res> {
  _$PatientHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? patientId = freezed,
    Object? report = null,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      report: null == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientHistoryImplCopyWith<$Res>
    implements $PatientHistoryCopyWith<$Res> {
  factory _$$PatientHistoryImplCopyWith(_$PatientHistoryImpl value,
          $Res Function(_$PatientHistoryImpl) then) =
      __$$PatientHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? patientId, String report, String? date});
}

/// @nodoc
class __$$PatientHistoryImplCopyWithImpl<$Res>
    extends _$PatientHistoryCopyWithImpl<$Res, _$PatientHistoryImpl>
    implements _$$PatientHistoryImplCopyWith<$Res> {
  __$$PatientHistoryImplCopyWithImpl(
      _$PatientHistoryImpl _value, $Res Function(_$PatientHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatientHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? patientId = freezed,
    Object? report = null,
    Object? date = freezed,
  }) {
    return _then(_$PatientHistoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      report: null == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientHistoryImpl implements _PatientHistory {
  const _$PatientHistoryImpl(
      {this.id, this.patientId, required this.report, this.date});

  factory _$PatientHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientHistoryImplFromJson(json);

  @override
  final String? id;
  @override
  final String? patientId;
  @override
  final String report;
  @override
  final String? date;

  @override
  String toString() {
    return 'PatientHistory(id: $id, patientId: $patientId, report: $report, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.report, report) || other.report == report) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, patientId, report, date);

  /// Create a copy of PatientHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientHistoryImplCopyWith<_$PatientHistoryImpl> get copyWith =>
      __$$PatientHistoryImplCopyWithImpl<_$PatientHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientHistoryImplToJson(
      this,
    );
  }
}

abstract class _PatientHistory implements PatientHistory {
  const factory _PatientHistory(
      {final String? id,
      final String? patientId,
      required final String report,
      final String? date}) = _$PatientHistoryImpl;

  factory _PatientHistory.fromJson(Map<String, dynamic> json) =
      _$PatientHistoryImpl.fromJson;

  @override
  String? get id;
  @override
  String? get patientId;
  @override
  String get report;
  @override
  String? get date;

  /// Create a copy of PatientHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientHistoryImplCopyWith<_$PatientHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientInfo _$PatientInfoFromJson(Map<String, dynamic> json) {
  return _PatientInfo.fromJson(json);
}

/// @nodoc
mixin _$PatientInfo {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this PatientInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientInfoCopyWith<PatientInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientInfoCopyWith<$Res> {
  factory $PatientInfoCopyWith(
          PatientInfo value, $Res Function(PatientInfo) then) =
      _$PatientInfoCopyWithImpl<$Res, PatientInfo>;
  @useResult
  $Res call({String? id, String? name, String? image});
}

/// @nodoc
class _$PatientInfoCopyWithImpl<$Res, $Val extends PatientInfo>
    implements $PatientInfoCopyWith<$Res> {
  _$PatientInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientInfoImplCopyWith<$Res>
    implements $PatientInfoCopyWith<$Res> {
  factory _$$PatientInfoImplCopyWith(
          _$PatientInfoImpl value, $Res Function(_$PatientInfoImpl) then) =
      __$$PatientInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, String? image});
}

/// @nodoc
class __$$PatientInfoImplCopyWithImpl<$Res>
    extends _$PatientInfoCopyWithImpl<$Res, _$PatientInfoImpl>
    implements _$$PatientInfoImplCopyWith<$Res> {
  __$$PatientInfoImplCopyWithImpl(
      _$PatientInfoImpl _value, $Res Function(_$PatientInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
  }) {
    return _then(_$PatientInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientInfoImpl implements _PatientInfo {
  const _$PatientInfoImpl({this.id, this.name, this.image});

  factory _$PatientInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientInfoImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? image;

  @override
  String toString() {
    return 'PatientInfo(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image);

  /// Create a copy of PatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientInfoImplCopyWith<_$PatientInfoImpl> get copyWith =>
      __$$PatientInfoImplCopyWithImpl<_$PatientInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientInfoImplToJson(
      this,
    );
  }
}

abstract class _PatientInfo implements PatientInfo {
  const factory _PatientInfo(
      {final String? id,
      final String? name,
      final String? image}) = _$PatientInfoImpl;

  factory _PatientInfo.fromJson(Map<String, dynamic> json) =
      _$PatientInfoImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get image;

  /// Create a copy of PatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientInfoImplCopyWith<_$PatientInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
