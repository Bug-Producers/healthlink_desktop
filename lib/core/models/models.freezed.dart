// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DoctorProfile {

 String? get id; String? get name; String? get city; String? get about; int? get appointmentDuration; int? get bufferTime; String? get image;
/// Create a copy of DoctorProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorProfileCopyWith<DoctorProfile> get copyWith => _$DoctorProfileCopyWithImpl<DoctorProfile>(this as DoctorProfile, _$identity);

  /// Serializes this DoctorProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city)&&(identical(other.about, about) || other.about == about)&&(identical(other.appointmentDuration, appointmentDuration) || other.appointmentDuration == appointmentDuration)&&(identical(other.bufferTime, bufferTime) || other.bufferTime == bufferTime)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,city,about,appointmentDuration,bufferTime,image);

@override
String toString() {
  return 'DoctorProfile(id: $id, name: $name, city: $city, about: $about, appointmentDuration: $appointmentDuration, bufferTime: $bufferTime, image: $image)';
}


}

/// @nodoc
abstract mixin class $DoctorProfileCopyWith<$Res>  {
  factory $DoctorProfileCopyWith(DoctorProfile value, $Res Function(DoctorProfile) _then) = _$DoctorProfileCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, String? city, String? about, int? appointmentDuration, int? bufferTime, String? image
});




}
/// @nodoc
class _$DoctorProfileCopyWithImpl<$Res>
    implements $DoctorProfileCopyWith<$Res> {
  _$DoctorProfileCopyWithImpl(this._self, this._then);

  final DoctorProfile _self;
  final $Res Function(DoctorProfile) _then;

/// Create a copy of DoctorProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? city = freezed,Object? about = freezed,Object? appointmentDuration = freezed,Object? bufferTime = freezed,Object? image = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,appointmentDuration: freezed == appointmentDuration ? _self.appointmentDuration : appointmentDuration // ignore: cast_nullable_to_non_nullable
as int?,bufferTime: freezed == bufferTime ? _self.bufferTime : bufferTime // ignore: cast_nullable_to_non_nullable
as int?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorProfile].
extension DoctorProfilePatterns on DoctorProfile {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorProfile() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorProfile value)  $default,){
final _that = this;
switch (_that) {
case _DoctorProfile():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorProfile value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorProfile() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name,  String? city,  String? about,  int? appointmentDuration,  int? bufferTime,  String? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorProfile() when $default != null:
return $default(_that.id,_that.name,_that.city,_that.about,_that.appointmentDuration,_that.bufferTime,_that.image);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name,  String? city,  String? about,  int? appointmentDuration,  int? bufferTime,  String? image)  $default,) {final _that = this;
switch (_that) {
case _DoctorProfile():
return $default(_that.id,_that.name,_that.city,_that.about,_that.appointmentDuration,_that.bufferTime,_that.image);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name,  String? city,  String? about,  int? appointmentDuration,  int? bufferTime,  String? image)?  $default,) {final _that = this;
switch (_that) {
case _DoctorProfile() when $default != null:
return $default(_that.id,_that.name,_that.city,_that.about,_that.appointmentDuration,_that.bufferTime,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorProfile implements DoctorProfile {
  const _DoctorProfile({this.id, this.name, this.city, this.about, this.appointmentDuration, this.bufferTime, this.image});
  factory _DoctorProfile.fromJson(Map<String, dynamic> json) => _$DoctorProfileFromJson(json);

@override final  String? id;
@override final  String? name;
@override final  String? city;
@override final  String? about;
@override final  int? appointmentDuration;
@override final  int? bufferTime;
@override final  String? image;

/// Create a copy of DoctorProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorProfileCopyWith<_DoctorProfile> get copyWith => __$DoctorProfileCopyWithImpl<_DoctorProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city)&&(identical(other.about, about) || other.about == about)&&(identical(other.appointmentDuration, appointmentDuration) || other.appointmentDuration == appointmentDuration)&&(identical(other.bufferTime, bufferTime) || other.bufferTime == bufferTime)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,city,about,appointmentDuration,bufferTime,image);

@override
String toString() {
  return 'DoctorProfile(id: $id, name: $name, city: $city, about: $about, appointmentDuration: $appointmentDuration, bufferTime: $bufferTime, image: $image)';
}


}

/// @nodoc
abstract mixin class _$DoctorProfileCopyWith<$Res> implements $DoctorProfileCopyWith<$Res> {
  factory _$DoctorProfileCopyWith(_DoctorProfile value, $Res Function(_DoctorProfile) _then) = __$DoctorProfileCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, String? city, String? about, int? appointmentDuration, int? bufferTime, String? image
});




}
/// @nodoc
class __$DoctorProfileCopyWithImpl<$Res>
    implements _$DoctorProfileCopyWith<$Res> {
  __$DoctorProfileCopyWithImpl(this._self, this._then);

  final _DoctorProfile _self;
  final $Res Function(_DoctorProfile) _then;

/// Create a copy of DoctorProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? city = freezed,Object? about = freezed,Object? appointmentDuration = freezed,Object? bufferTime = freezed,Object? image = freezed,}) {
  return _then(_DoctorProfile(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,appointmentDuration: freezed == appointmentDuration ? _self.appointmentDuration : appointmentDuration // ignore: cast_nullable_to_non_nullable
as int?,bufferTime: freezed == bufferTime ? _self.bufferTime : bufferTime // ignore: cast_nullable_to_non_nullable
as int?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TimeSlot {

 String get startTime; String get endTime;
/// Create a copy of TimeSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeSlotCopyWith<TimeSlot> get copyWith => _$TimeSlotCopyWithImpl<TimeSlot>(this as TimeSlot, _$identity);

  /// Serializes this TimeSlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlot&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startTime,endTime);

@override
String toString() {
  return 'TimeSlot(startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class $TimeSlotCopyWith<$Res>  {
  factory $TimeSlotCopyWith(TimeSlot value, $Res Function(TimeSlot) _then) = _$TimeSlotCopyWithImpl;
@useResult
$Res call({
 String startTime, String endTime
});




}
/// @nodoc
class _$TimeSlotCopyWithImpl<$Res>
    implements $TimeSlotCopyWith<$Res> {
  _$TimeSlotCopyWithImpl(this._self, this._then);

  final TimeSlot _self;
  final $Res Function(TimeSlot) _then;

/// Create a copy of TimeSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startTime = null,Object? endTime = null,}) {
  return _then(_self.copyWith(
startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeSlot].
extension TimeSlotPatterns on TimeSlot {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeSlot() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeSlot value)  $default,){
final _that = this;
switch (_that) {
case _TimeSlot():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeSlot value)?  $default,){
final _that = this;
switch (_that) {
case _TimeSlot() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String startTime,  String endTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeSlot() when $default != null:
return $default(_that.startTime,_that.endTime);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String startTime,  String endTime)  $default,) {final _that = this;
switch (_that) {
case _TimeSlot():
return $default(_that.startTime,_that.endTime);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String startTime,  String endTime)?  $default,) {final _that = this;
switch (_that) {
case _TimeSlot() when $default != null:
return $default(_that.startTime,_that.endTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeSlot implements TimeSlot {
  const _TimeSlot({required this.startTime, required this.endTime});
  factory _TimeSlot.fromJson(Map<String, dynamic> json) => _$TimeSlotFromJson(json);

@override final  String startTime;
@override final  String endTime;

/// Create a copy of TimeSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeSlotCopyWith<_TimeSlot> get copyWith => __$TimeSlotCopyWithImpl<_TimeSlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeSlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeSlot&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startTime,endTime);

@override
String toString() {
  return 'TimeSlot(startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class _$TimeSlotCopyWith<$Res> implements $TimeSlotCopyWith<$Res> {
  factory _$TimeSlotCopyWith(_TimeSlot value, $Res Function(_TimeSlot) _then) = __$TimeSlotCopyWithImpl;
@override @useResult
$Res call({
 String startTime, String endTime
});




}
/// @nodoc
class __$TimeSlotCopyWithImpl<$Res>
    implements _$TimeSlotCopyWith<$Res> {
  __$TimeSlotCopyWithImpl(this._self, this._then);

  final _TimeSlot _self;
  final $Res Function(_TimeSlot) _then;

/// Create a copy of TimeSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startTime = null,Object? endTime = null,}) {
  return _then(_TimeSlot(
startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DoctorSchedule {

 String? get doctorId; Map<String, List<TimeSlot>> get availability;
/// Create a copy of DoctorSchedule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorScheduleCopyWith<DoctorSchedule> get copyWith => _$DoctorScheduleCopyWithImpl<DoctorSchedule>(this as DoctorSchedule, _$identity);

  /// Serializes this DoctorSchedule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorSchedule&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&const DeepCollectionEquality().equals(other.availability, availability));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,const DeepCollectionEquality().hash(availability));

@override
String toString() {
  return 'DoctorSchedule(doctorId: $doctorId, availability: $availability)';
}


}

/// @nodoc
abstract mixin class $DoctorScheduleCopyWith<$Res>  {
  factory $DoctorScheduleCopyWith(DoctorSchedule value, $Res Function(DoctorSchedule) _then) = _$DoctorScheduleCopyWithImpl;
@useResult
$Res call({
 String? doctorId, Map<String, List<TimeSlot>> availability
});




}
/// @nodoc
class _$DoctorScheduleCopyWithImpl<$Res>
    implements $DoctorScheduleCopyWith<$Res> {
  _$DoctorScheduleCopyWithImpl(this._self, this._then);

  final DoctorSchedule _self;
  final $Res Function(DoctorSchedule) _then;

/// Create a copy of DoctorSchedule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctorId = freezed,Object? availability = null,}) {
  return _then(_self.copyWith(
doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as Map<String, List<TimeSlot>>,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorSchedule].
extension DoctorSchedulePatterns on DoctorSchedule {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorSchedule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorSchedule() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorSchedule value)  $default,){
final _that = this;
switch (_that) {
case _DoctorSchedule():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorSchedule value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorSchedule() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? doctorId,  Map<String, List<TimeSlot>> availability)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorSchedule() when $default != null:
return $default(_that.doctorId,_that.availability);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? doctorId,  Map<String, List<TimeSlot>> availability)  $default,) {final _that = this;
switch (_that) {
case _DoctorSchedule():
return $default(_that.doctorId,_that.availability);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? doctorId,  Map<String, List<TimeSlot>> availability)?  $default,) {final _that = this;
switch (_that) {
case _DoctorSchedule() when $default != null:
return $default(_that.doctorId,_that.availability);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorSchedule implements DoctorSchedule {
  const _DoctorSchedule({this.doctorId, required final  Map<String, List<TimeSlot>> availability}): _availability = availability;
  factory _DoctorSchedule.fromJson(Map<String, dynamic> json) => _$DoctorScheduleFromJson(json);

@override final  String? doctorId;
 final  Map<String, List<TimeSlot>> _availability;
@override Map<String, List<TimeSlot>> get availability {
  if (_availability is EqualUnmodifiableMapView) return _availability;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_availability);
}


/// Create a copy of DoctorSchedule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorScheduleCopyWith<_DoctorSchedule> get copyWith => __$DoctorScheduleCopyWithImpl<_DoctorSchedule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorScheduleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorSchedule&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&const DeepCollectionEquality().equals(other._availability, _availability));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,const DeepCollectionEquality().hash(_availability));

@override
String toString() {
  return 'DoctorSchedule(doctorId: $doctorId, availability: $availability)';
}


}

/// @nodoc
abstract mixin class _$DoctorScheduleCopyWith<$Res> implements $DoctorScheduleCopyWith<$Res> {
  factory _$DoctorScheduleCopyWith(_DoctorSchedule value, $Res Function(_DoctorSchedule) _then) = __$DoctorScheduleCopyWithImpl;
@override @useResult
$Res call({
 String? doctorId, Map<String, List<TimeSlot>> availability
});




}
/// @nodoc
class __$DoctorScheduleCopyWithImpl<$Res>
    implements _$DoctorScheduleCopyWith<$Res> {
  __$DoctorScheduleCopyWithImpl(this._self, this._then);

  final _DoctorSchedule _self;
  final $Res Function(_DoctorSchedule) _then;

/// Create a copy of DoctorSchedule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctorId = freezed,Object? availability = null,}) {
  return _then(_DoctorSchedule(
doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,availability: null == availability ? _self._availability : availability // ignore: cast_nullable_to_non_nullable
as Map<String, List<TimeSlot>>,
  ));
}


}


/// @nodoc
mixin _$Appointment {

 String get id; String get doctorId; String? get patientId; String? get patientName; String? get patientImage; String get date; String get startTime; String get endTime; int get status;
/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentCopyWith<Appointment> get copyWith => _$AppointmentCopyWithImpl<Appointment>(this as Appointment, _$identity);

  /// Serializes this Appointment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Appointment&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.patientImage, patientImage) || other.patientImage == patientImage)&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doctorId,patientId,patientName,patientImage,date,startTime,endTime,status);

@override
String toString() {
  return 'Appointment(id: $id, doctorId: $doctorId, patientId: $patientId, patientName: $patientName, patientImage: $patientImage, date: $date, startTime: $startTime, endTime: $endTime, status: $status)';
}


}

/// @nodoc
abstract mixin class $AppointmentCopyWith<$Res>  {
  factory $AppointmentCopyWith(Appointment value, $Res Function(Appointment) _then) = _$AppointmentCopyWithImpl;
@useResult
$Res call({
 String id, String doctorId, String? patientId, String? patientName, String? patientImage, String date, String startTime, String endTime, int status
});




}
/// @nodoc
class _$AppointmentCopyWithImpl<$Res>
    implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._self, this._then);

  final Appointment _self;
  final $Res Function(Appointment) _then;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? doctorId = null,Object? patientId = freezed,Object? patientName = freezed,Object? patientImage = freezed,Object? date = null,Object? startTime = null,Object? endTime = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,patientId: freezed == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String?,patientName: freezed == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String?,patientImage: freezed == patientImage ? _self.patientImage : patientImage // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Appointment].
extension AppointmentPatterns on Appointment {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Appointment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Appointment() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Appointment value)  $default,){
final _that = this;
switch (_that) {
case _Appointment():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Appointment value)?  $default,){
final _that = this;
switch (_that) {
case _Appointment() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String doctorId,  String? patientId,  String? patientName,  String? patientImage,  String date,  String startTime,  String endTime,  int status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Appointment() when $default != null:
return $default(_that.id,_that.doctorId,_that.patientId,_that.patientName,_that.patientImage,_that.date,_that.startTime,_that.endTime,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String doctorId,  String? patientId,  String? patientName,  String? patientImage,  String date,  String startTime,  String endTime,  int status)  $default,) {final _that = this;
switch (_that) {
case _Appointment():
return $default(_that.id,_that.doctorId,_that.patientId,_that.patientName,_that.patientImage,_that.date,_that.startTime,_that.endTime,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String doctorId,  String? patientId,  String? patientName,  String? patientImage,  String date,  String startTime,  String endTime,  int status)?  $default,) {final _that = this;
switch (_that) {
case _Appointment() when $default != null:
return $default(_that.id,_that.doctorId,_that.patientId,_that.patientName,_that.patientImage,_that.date,_that.startTime,_that.endTime,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Appointment implements Appointment {
  const _Appointment({required this.id, required this.doctorId, this.patientId, this.patientName, this.patientImage, required this.date, required this.startTime, required this.endTime, this.status = 0});
  factory _Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);

@override final  String id;
@override final  String doctorId;
@override final  String? patientId;
@override final  String? patientName;
@override final  String? patientImage;
@override final  String date;
@override final  String startTime;
@override final  String endTime;
@override@JsonKey() final  int status;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentCopyWith<_Appointment> get copyWith => __$AppointmentCopyWithImpl<_Appointment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Appointment&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.patientImage, patientImage) || other.patientImage == patientImage)&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doctorId,patientId,patientName,patientImage,date,startTime,endTime,status);

@override
String toString() {
  return 'Appointment(id: $id, doctorId: $doctorId, patientId: $patientId, patientName: $patientName, patientImage: $patientImage, date: $date, startTime: $startTime, endTime: $endTime, status: $status)';
}


}

/// @nodoc
abstract mixin class _$AppointmentCopyWith<$Res> implements $AppointmentCopyWith<$Res> {
  factory _$AppointmentCopyWith(_Appointment value, $Res Function(_Appointment) _then) = __$AppointmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String doctorId, String? patientId, String? patientName, String? patientImage, String date, String startTime, String endTime, int status
});




}
/// @nodoc
class __$AppointmentCopyWithImpl<$Res>
    implements _$AppointmentCopyWith<$Res> {
  __$AppointmentCopyWithImpl(this._self, this._then);

  final _Appointment _self;
  final $Res Function(_Appointment) _then;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? doctorId = null,Object? patientId = freezed,Object? patientName = freezed,Object? patientImage = freezed,Object? date = null,Object? startTime = null,Object? endTime = null,Object? status = null,}) {
  return _then(_Appointment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,patientId: freezed == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String?,patientName: freezed == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String?,patientImage: freezed == patientImage ? _self.patientImage : patientImage // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Payment {

 String? get id; String get patientId; String get appointmentId; double get amount; String? get date;
/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentCopyWith<Payment> get copyWith => _$PaymentCopyWithImpl<Payment>(this as Payment, _$identity);

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Payment&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,appointmentId,amount,date);

@override
String toString() {
  return 'Payment(id: $id, patientId: $patientId, appointmentId: $appointmentId, amount: $amount, date: $date)';
}


}

/// @nodoc
abstract mixin class $PaymentCopyWith<$Res>  {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) _then) = _$PaymentCopyWithImpl;
@useResult
$Res call({
 String? id, String patientId, String appointmentId, double amount, String? date
});




}
/// @nodoc
class _$PaymentCopyWithImpl<$Res>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._self, this._then);

  final Payment _self;
  final $Res Function(Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? patientId = null,Object? appointmentId = null,Object? amount = null,Object? date = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,appointmentId: null == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Payment].
extension PaymentPatterns on Payment {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Payment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Payment value)  $default,){
final _that = this;
switch (_that) {
case _Payment():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Payment value)?  $default,){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String patientId,  String appointmentId,  double amount,  String? date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.id,_that.patientId,_that.appointmentId,_that.amount,_that.date);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String patientId,  String appointmentId,  double amount,  String? date)  $default,) {final _that = this;
switch (_that) {
case _Payment():
return $default(_that.id,_that.patientId,_that.appointmentId,_that.amount,_that.date);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String patientId,  String appointmentId,  double amount,  String? date)?  $default,) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.id,_that.patientId,_that.appointmentId,_that.amount,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Payment implements Payment {
  const _Payment({this.id, required this.patientId, required this.appointmentId, required this.amount, this.date});
  factory _Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

@override final  String? id;
@override final  String patientId;
@override final  String appointmentId;
@override final  double amount;
@override final  String? date;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentCopyWith<_Payment> get copyWith => __$PaymentCopyWithImpl<_Payment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Payment&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.appointmentId, appointmentId) || other.appointmentId == appointmentId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,appointmentId,amount,date);

@override
String toString() {
  return 'Payment(id: $id, patientId: $patientId, appointmentId: $appointmentId, amount: $amount, date: $date)';
}


}

/// @nodoc
abstract mixin class _$PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$PaymentCopyWith(_Payment value, $Res Function(_Payment) _then) = __$PaymentCopyWithImpl;
@override @useResult
$Res call({
 String? id, String patientId, String appointmentId, double amount, String? date
});




}
/// @nodoc
class __$PaymentCopyWithImpl<$Res>
    implements _$PaymentCopyWith<$Res> {
  __$PaymentCopyWithImpl(this._self, this._then);

  final _Payment _self;
  final $Res Function(_Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? patientId = null,Object? appointmentId = null,Object? amount = null,Object? date = freezed,}) {
  return _then(_Payment(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,appointmentId: null == appointmentId ? _self.appointmentId : appointmentId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DailyBreakdown {

 String get date; double get total;
/// Create a copy of DailyBreakdown
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyBreakdownCopyWith<DailyBreakdown> get copyWith => _$DailyBreakdownCopyWithImpl<DailyBreakdown>(this as DailyBreakdown, _$identity);

  /// Serializes this DailyBreakdown to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyBreakdown&&(identical(other.date, date) || other.date == date)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,total);

@override
String toString() {
  return 'DailyBreakdown(date: $date, total: $total)';
}


}

/// @nodoc
abstract mixin class $DailyBreakdownCopyWith<$Res>  {
  factory $DailyBreakdownCopyWith(DailyBreakdown value, $Res Function(DailyBreakdown) _then) = _$DailyBreakdownCopyWithImpl;
@useResult
$Res call({
 String date, double total
});




}
/// @nodoc
class _$DailyBreakdownCopyWithImpl<$Res>
    implements $DailyBreakdownCopyWith<$Res> {
  _$DailyBreakdownCopyWithImpl(this._self, this._then);

  final DailyBreakdown _self;
  final $Res Function(DailyBreakdown) _then;

/// Create a copy of DailyBreakdown
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? total = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyBreakdown].
extension DailyBreakdownPatterns on DailyBreakdown {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyBreakdown value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyBreakdown() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyBreakdown value)  $default,){
final _that = this;
switch (_that) {
case _DailyBreakdown():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyBreakdown value)?  $default,){
final _that = this;
switch (_that) {
case _DailyBreakdown() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  double total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyBreakdown() when $default != null:
return $default(_that.date,_that.total);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  double total)  $default,) {final _that = this;
switch (_that) {
case _DailyBreakdown():
return $default(_that.date,_that.total);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  double total)?  $default,) {final _that = this;
switch (_that) {
case _DailyBreakdown() when $default != null:
return $default(_that.date,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyBreakdown implements DailyBreakdown {
  const _DailyBreakdown({required this.date, required this.total});
  factory _DailyBreakdown.fromJson(Map<String, dynamic> json) => _$DailyBreakdownFromJson(json);

@override final  String date;
@override final  double total;

/// Create a copy of DailyBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyBreakdownCopyWith<_DailyBreakdown> get copyWith => __$DailyBreakdownCopyWithImpl<_DailyBreakdown>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyBreakdownToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyBreakdown&&(identical(other.date, date) || other.date == date)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,total);

@override
String toString() {
  return 'DailyBreakdown(date: $date, total: $total)';
}


}

/// @nodoc
abstract mixin class _$DailyBreakdownCopyWith<$Res> implements $DailyBreakdownCopyWith<$Res> {
  factory _$DailyBreakdownCopyWith(_DailyBreakdown value, $Res Function(_DailyBreakdown) _then) = __$DailyBreakdownCopyWithImpl;
@override @useResult
$Res call({
 String date, double total
});




}
/// @nodoc
class __$DailyBreakdownCopyWithImpl<$Res>
    implements _$DailyBreakdownCopyWith<$Res> {
  __$DailyBreakdownCopyWithImpl(this._self, this._then);

  final _DailyBreakdown _self;
  final $Res Function(_DailyBreakdown) _then;

/// Create a copy of DailyBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? total = null,}) {
  return _then(_DailyBreakdown(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$RevenueData {

 double get totalEarnings; int get totalPayments; List<DailyBreakdown> get dailyBreakdown;
/// Create a copy of RevenueData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RevenueDataCopyWith<RevenueData> get copyWith => _$RevenueDataCopyWithImpl<RevenueData>(this as RevenueData, _$identity);

  /// Serializes this RevenueData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RevenueData&&(identical(other.totalEarnings, totalEarnings) || other.totalEarnings == totalEarnings)&&(identical(other.totalPayments, totalPayments) || other.totalPayments == totalPayments)&&const DeepCollectionEquality().equals(other.dailyBreakdown, dailyBreakdown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalEarnings,totalPayments,const DeepCollectionEquality().hash(dailyBreakdown));

@override
String toString() {
  return 'RevenueData(totalEarnings: $totalEarnings, totalPayments: $totalPayments, dailyBreakdown: $dailyBreakdown)';
}


}

/// @nodoc
abstract mixin class $RevenueDataCopyWith<$Res>  {
  factory $RevenueDataCopyWith(RevenueData value, $Res Function(RevenueData) _then) = _$RevenueDataCopyWithImpl;
@useResult
$Res call({
 double totalEarnings, int totalPayments, List<DailyBreakdown> dailyBreakdown
});




}
/// @nodoc
class _$RevenueDataCopyWithImpl<$Res>
    implements $RevenueDataCopyWith<$Res> {
  _$RevenueDataCopyWithImpl(this._self, this._then);

  final RevenueData _self;
  final $Res Function(RevenueData) _then;

/// Create a copy of RevenueData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalEarnings = null,Object? totalPayments = null,Object? dailyBreakdown = null,}) {
  return _then(_self.copyWith(
totalEarnings: null == totalEarnings ? _self.totalEarnings : totalEarnings // ignore: cast_nullable_to_non_nullable
as double,totalPayments: null == totalPayments ? _self.totalPayments : totalPayments // ignore: cast_nullable_to_non_nullable
as int,dailyBreakdown: null == dailyBreakdown ? _self.dailyBreakdown : dailyBreakdown // ignore: cast_nullable_to_non_nullable
as List<DailyBreakdown>,
  ));
}

}


/// Adds pattern-matching-related methods to [RevenueData].
extension RevenueDataPatterns on RevenueData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RevenueData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RevenueData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RevenueData value)  $default,){
final _that = this;
switch (_that) {
case _RevenueData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RevenueData value)?  $default,){
final _that = this;
switch (_that) {
case _RevenueData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalEarnings,  int totalPayments,  List<DailyBreakdown> dailyBreakdown)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RevenueData() when $default != null:
return $default(_that.totalEarnings,_that.totalPayments,_that.dailyBreakdown);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalEarnings,  int totalPayments,  List<DailyBreakdown> dailyBreakdown)  $default,) {final _that = this;
switch (_that) {
case _RevenueData():
return $default(_that.totalEarnings,_that.totalPayments,_that.dailyBreakdown);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalEarnings,  int totalPayments,  List<DailyBreakdown> dailyBreakdown)?  $default,) {final _that = this;
switch (_that) {
case _RevenueData() when $default != null:
return $default(_that.totalEarnings,_that.totalPayments,_that.dailyBreakdown);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RevenueData implements RevenueData {
  const _RevenueData({this.totalEarnings = 0.0, this.totalPayments = 0, final  List<DailyBreakdown> dailyBreakdown = const []}): _dailyBreakdown = dailyBreakdown;
  factory _RevenueData.fromJson(Map<String, dynamic> json) => _$RevenueDataFromJson(json);

@override@JsonKey() final  double totalEarnings;
@override@JsonKey() final  int totalPayments;
 final  List<DailyBreakdown> _dailyBreakdown;
@override@JsonKey() List<DailyBreakdown> get dailyBreakdown {
  if (_dailyBreakdown is EqualUnmodifiableListView) return _dailyBreakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dailyBreakdown);
}


/// Create a copy of RevenueData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RevenueDataCopyWith<_RevenueData> get copyWith => __$RevenueDataCopyWithImpl<_RevenueData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RevenueDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RevenueData&&(identical(other.totalEarnings, totalEarnings) || other.totalEarnings == totalEarnings)&&(identical(other.totalPayments, totalPayments) || other.totalPayments == totalPayments)&&const DeepCollectionEquality().equals(other._dailyBreakdown, _dailyBreakdown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalEarnings,totalPayments,const DeepCollectionEquality().hash(_dailyBreakdown));

@override
String toString() {
  return 'RevenueData(totalEarnings: $totalEarnings, totalPayments: $totalPayments, dailyBreakdown: $dailyBreakdown)';
}


}

/// @nodoc
abstract mixin class _$RevenueDataCopyWith<$Res> implements $RevenueDataCopyWith<$Res> {
  factory _$RevenueDataCopyWith(_RevenueData value, $Res Function(_RevenueData) _then) = __$RevenueDataCopyWithImpl;
@override @useResult
$Res call({
 double totalEarnings, int totalPayments, List<DailyBreakdown> dailyBreakdown
});




}
/// @nodoc
class __$RevenueDataCopyWithImpl<$Res>
    implements _$RevenueDataCopyWith<$Res> {
  __$RevenueDataCopyWithImpl(this._self, this._then);

  final _RevenueData _self;
  final $Res Function(_RevenueData) _then;

/// Create a copy of RevenueData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalEarnings = null,Object? totalPayments = null,Object? dailyBreakdown = null,}) {
  return _then(_RevenueData(
totalEarnings: null == totalEarnings ? _self.totalEarnings : totalEarnings // ignore: cast_nullable_to_non_nullable
as double,totalPayments: null == totalPayments ? _self.totalPayments : totalPayments // ignore: cast_nullable_to_non_nullable
as int,dailyBreakdown: null == dailyBreakdown ? _self._dailyBreakdown : dailyBreakdown // ignore: cast_nullable_to_non_nullable
as List<DailyBreakdown>,
  ));
}


}


/// @nodoc
mixin _$SystemNotification {

 String get id; String get message; bool get read; String? get date;
/// Create a copy of SystemNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SystemNotificationCopyWith<SystemNotification> get copyWith => _$SystemNotificationCopyWithImpl<SystemNotification>(this as SystemNotification, _$identity);

  /// Serializes this SystemNotification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SystemNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.read, read) || other.read == read)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,message,read,date);

@override
String toString() {
  return 'SystemNotification(id: $id, message: $message, read: $read, date: $date)';
}


}

/// @nodoc
abstract mixin class $SystemNotificationCopyWith<$Res>  {
  factory $SystemNotificationCopyWith(SystemNotification value, $Res Function(SystemNotification) _then) = _$SystemNotificationCopyWithImpl;
@useResult
$Res call({
 String id, String message, bool read, String? date
});




}
/// @nodoc
class _$SystemNotificationCopyWithImpl<$Res>
    implements $SystemNotificationCopyWith<$Res> {
  _$SystemNotificationCopyWithImpl(this._self, this._then);

  final SystemNotification _self;
  final $Res Function(SystemNotification) _then;

/// Create a copy of SystemNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? message = null,Object? read = null,Object? date = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,read: null == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SystemNotification].
extension SystemNotificationPatterns on SystemNotification {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SystemNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SystemNotification() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SystemNotification value)  $default,){
final _that = this;
switch (_that) {
case _SystemNotification():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SystemNotification value)?  $default,){
final _that = this;
switch (_that) {
case _SystemNotification() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String message,  bool read,  String? date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SystemNotification() when $default != null:
return $default(_that.id,_that.message,_that.read,_that.date);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String message,  bool read,  String? date)  $default,) {final _that = this;
switch (_that) {
case _SystemNotification():
return $default(_that.id,_that.message,_that.read,_that.date);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String message,  bool read,  String? date)?  $default,) {final _that = this;
switch (_that) {
case _SystemNotification() when $default != null:
return $default(_that.id,_that.message,_that.read,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SystemNotification implements SystemNotification {
  const _SystemNotification({required this.id, required this.message, this.read = false, this.date});
  factory _SystemNotification.fromJson(Map<String, dynamic> json) => _$SystemNotificationFromJson(json);

@override final  String id;
@override final  String message;
@override@JsonKey() final  bool read;
@override final  String? date;

/// Create a copy of SystemNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SystemNotificationCopyWith<_SystemNotification> get copyWith => __$SystemNotificationCopyWithImpl<_SystemNotification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SystemNotificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SystemNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.read, read) || other.read == read)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,message,read,date);

@override
String toString() {
  return 'SystemNotification(id: $id, message: $message, read: $read, date: $date)';
}


}

/// @nodoc
abstract mixin class _$SystemNotificationCopyWith<$Res> implements $SystemNotificationCopyWith<$Res> {
  factory _$SystemNotificationCopyWith(_SystemNotification value, $Res Function(_SystemNotification) _then) = __$SystemNotificationCopyWithImpl;
@override @useResult
$Res call({
 String id, String message, bool read, String? date
});




}
/// @nodoc
class __$SystemNotificationCopyWithImpl<$Res>
    implements _$SystemNotificationCopyWith<$Res> {
  __$SystemNotificationCopyWithImpl(this._self, this._then);

  final _SystemNotification _self;
  final $Res Function(_SystemNotification) _then;

/// Create a copy of SystemNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? message = null,Object? read = null,Object? date = freezed,}) {
  return _then(_SystemNotification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,read: null == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
