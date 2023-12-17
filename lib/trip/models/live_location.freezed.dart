// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LiveLocation _$LiveLocationFromJson(Map<String, dynamic> json) {
  return _LiveLocation.fromJson(json);
}

/// @nodoc
mixin _$LiveLocation {
  /// The latitude of this position in degrees normalized to the interval -90.0
  /// to +90.0 (both inclusive).
  double get latitude => throw _privateConstructorUsedError;

  /// The longitude of the position in degrees normalized to the interval -180
  /// (exclusive) to +180 (inclusive).
  double get longitude => throw _privateConstructorUsedError;
  String get geohash => throw _privateConstructorUsedError;

  /// The estimated horizontal accuracy of the position in meters.
  ///
  /// The accuracy is not available on all devices. In these cases the value is
  /// 0.0.
  double get accuracy => throw _privateConstructorUsedError;

  /// The heading in which the device is traveling in degrees.
  ///
  /// The heading is not available on all devices. In these cases the value is
  /// 0.0.
  double get heading => throw _privateConstructorUsedError;

  /// The altitude of the device in meters.
  ///
  /// The altitude is not available on all devices. In these cases the returned
  /// value is 0.0.
  double get altitude => throw _privateConstructorUsedError;

  /// The speed at which the devices is traveling in meters per second over
  /// ground.
  ///
  /// The speed is not available on all devices. In these cases the value is
  /// 0.0.
  double get speed => throw _privateConstructorUsedError;

  /// The estimated speed accuracy of this position, in meters per second.
  ///
  /// The speedAccuracy is not available on all devices. In these cases the
  /// value is 0.0.
  double get speedAccuracy => throw _privateConstructorUsedError;

  /// The time at which this location was determined.
  @DateTimeJsonConverter()
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveLocationCopyWith<LiveLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveLocationCopyWith<$Res> {
  factory $LiveLocationCopyWith(
          LiveLocation value, $Res Function(LiveLocation) then) =
      _$LiveLocationCopyWithImpl<$Res, LiveLocation>;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      String geohash,
      double accuracy,
      double heading,
      double altitude,
      double speed,
      double speedAccuracy,
      @DateTimeJsonConverter() DateTime timestamp});
}

/// @nodoc
class _$LiveLocationCopyWithImpl<$Res, $Val extends LiveLocation>
    implements $LiveLocationCopyWith<$Res> {
  _$LiveLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? geohash = null,
    Object? accuracy = null,
    Object? heading = null,
    Object? altitude = null,
    Object? speed = null,
    Object? speedAccuracy = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      geohash: null == geohash
          ? _value.geohash
          : geohash // ignore: cast_nullable_to_non_nullable
              as String,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double,
      altitude: null == altitude
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      speedAccuracy: null == speedAccuracy
          ? _value.speedAccuracy
          : speedAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveLocationImplCopyWith<$Res>
    implements $LiveLocationCopyWith<$Res> {
  factory _$$LiveLocationImplCopyWith(
          _$LiveLocationImpl value, $Res Function(_$LiveLocationImpl) then) =
      __$$LiveLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      String geohash,
      double accuracy,
      double heading,
      double altitude,
      double speed,
      double speedAccuracy,
      @DateTimeJsonConverter() DateTime timestamp});
}

/// @nodoc
class __$$LiveLocationImplCopyWithImpl<$Res>
    extends _$LiveLocationCopyWithImpl<$Res, _$LiveLocationImpl>
    implements _$$LiveLocationImplCopyWith<$Res> {
  __$$LiveLocationImplCopyWithImpl(
      _$LiveLocationImpl _value, $Res Function(_$LiveLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? geohash = null,
    Object? accuracy = null,
    Object? heading = null,
    Object? altitude = null,
    Object? speed = null,
    Object? speedAccuracy = null,
    Object? timestamp = null,
  }) {
    return _then(_$LiveLocationImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      geohash: null == geohash
          ? _value.geohash
          : geohash // ignore: cast_nullable_to_non_nullable
              as String,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double,
      altitude: null == altitude
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      speedAccuracy: null == speedAccuracy
          ? _value.speedAccuracy
          : speedAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveLocationImpl implements _LiveLocation {
  const _$LiveLocationImpl(
      {required this.latitude,
      required this.longitude,
      required this.geohash,
      required this.accuracy,
      required this.heading,
      required this.altitude,
      required this.speed,
      required this.speedAccuracy,
      @DateTimeJsonConverter() required this.timestamp});

  factory _$LiveLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveLocationImplFromJson(json);

  /// The latitude of this position in degrees normalized to the interval -90.0
  /// to +90.0 (both inclusive).
  @override
  final double latitude;

  /// The longitude of the position in degrees normalized to the interval -180
  /// (exclusive) to +180 (inclusive).
  @override
  final double longitude;
  @override
  final String geohash;

  /// The estimated horizontal accuracy of the position in meters.
  ///
  /// The accuracy is not available on all devices. In these cases the value is
  /// 0.0.
  @override
  final double accuracy;

  /// The heading in which the device is traveling in degrees.
  ///
  /// The heading is not available on all devices. In these cases the value is
  /// 0.0.
  @override
  final double heading;

  /// The altitude of the device in meters.
  ///
  /// The altitude is not available on all devices. In these cases the returned
  /// value is 0.0.
  @override
  final double altitude;

  /// The speed at which the devices is traveling in meters per second over
  /// ground.
  ///
  /// The speed is not available on all devices. In these cases the value is
  /// 0.0.
  @override
  final double speed;

  /// The estimated speed accuracy of this position, in meters per second.
  ///
  /// The speedAccuracy is not available on all devices. In these cases the
  /// value is 0.0.
  @override
  final double speedAccuracy;

  /// The time at which this location was determined.
  @override
  @DateTimeJsonConverter()
  final DateTime timestamp;

  @override
  String toString() {
    return 'LiveLocation(latitude: $latitude, longitude: $longitude, geohash: $geohash, accuracy: $accuracy, heading: $heading, altitude: $altitude, speed: $speed, speedAccuracy: $speedAccuracy, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveLocationImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.geohash, geohash) || other.geohash == geohash) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.altitude, altitude) ||
                other.altitude == altitude) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.speedAccuracy, speedAccuracy) ||
                other.speedAccuracy == speedAccuracy) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, geohash,
      accuracy, heading, altitude, speed, speedAccuracy, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveLocationImplCopyWith<_$LiveLocationImpl> get copyWith =>
      __$$LiveLocationImplCopyWithImpl<_$LiveLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveLocationImplToJson(
      this,
    );
  }
}

abstract class _LiveLocation implements LiveLocation {
  const factory _LiveLocation(
          {required final double latitude,
          required final double longitude,
          required final String geohash,
          required final double accuracy,
          required final double heading,
          required final double altitude,
          required final double speed,
          required final double speedAccuracy,
          @DateTimeJsonConverter() required final DateTime timestamp}) =
      _$LiveLocationImpl;

  factory _LiveLocation.fromJson(Map<String, dynamic> json) =
      _$LiveLocationImpl.fromJson;

  @override

  /// The latitude of this position in degrees normalized to the interval -90.0
  /// to +90.0 (both inclusive).
  double get latitude;
  @override

  /// The longitude of the position in degrees normalized to the interval -180
  /// (exclusive) to +180 (inclusive).
  double get longitude;
  @override
  String get geohash;
  @override

  /// The estimated horizontal accuracy of the position in meters.
  ///
  /// The accuracy is not available on all devices. In these cases the value is
  /// 0.0.
  double get accuracy;
  @override

  /// The heading in which the device is traveling in degrees.
  ///
  /// The heading is not available on all devices. In these cases the value is
  /// 0.0.
  double get heading;
  @override

  /// The altitude of the device in meters.
  ///
  /// The altitude is not available on all devices. In these cases the returned
  /// value is 0.0.
  double get altitude;
  @override

  /// The speed at which the devices is traveling in meters per second over
  /// ground.
  ///
  /// The speed is not available on all devices. In these cases the value is
  /// 0.0.
  double get speed;
  @override

  /// The estimated speed accuracy of this position, in meters per second.
  ///
  /// The speedAccuracy is not available on all devices. In these cases the
  /// value is 0.0.
  double get speedAccuracy;
  @override

  /// The time at which this location was determined.
  @DateTimeJsonConverter()
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$LiveLocationImplCopyWith<_$LiveLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
