// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus_stop_alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BusStopAlert _$BusStopAlertFromJson(Map<String, dynamic> json) {
  return _BusStopAlert.fromJson(json);
}

/// @nodoc
mixin _$BusStopAlert {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get tripId => throw _privateConstructorUsedError;
  BusStop get busStop => throw _privateConstructorUsedError;
  bool get isTriggered => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusStopAlertCopyWith<BusStopAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusStopAlertCopyWith<$Res> {
  factory $BusStopAlertCopyWith(
          BusStopAlert value, $Res Function(BusStopAlert) then) =
      _$BusStopAlertCopyWithImpl<$Res, BusStopAlert>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String tripId,
      BusStop busStop,
      bool isTriggered,
      DateTime createdAt,
      DateTime updatedAt});

  $BusStopCopyWith<$Res> get busStop;
}

/// @nodoc
class _$BusStopAlertCopyWithImpl<$Res, $Val extends BusStopAlert>
    implements $BusStopAlertCopyWith<$Res> {
  _$BusStopAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? tripId = null,
    Object? busStop = null,
    Object? isTriggered = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      busStop: null == busStop
          ? _value.busStop
          : busStop // ignore: cast_nullable_to_non_nullable
              as BusStop,
      isTriggered: null == isTriggered
          ? _value.isTriggered
          : isTriggered // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BusStopCopyWith<$Res> get busStop {
    return $BusStopCopyWith<$Res>(_value.busStop, (value) {
      return _then(_value.copyWith(busStop: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BusStopAlertImplCopyWith<$Res>
    implements $BusStopAlertCopyWith<$Res> {
  factory _$$BusStopAlertImplCopyWith(
          _$BusStopAlertImpl value, $Res Function(_$BusStopAlertImpl) then) =
      __$$BusStopAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String tripId,
      BusStop busStop,
      bool isTriggered,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $BusStopCopyWith<$Res> get busStop;
}

/// @nodoc
class __$$BusStopAlertImplCopyWithImpl<$Res>
    extends _$BusStopAlertCopyWithImpl<$Res, _$BusStopAlertImpl>
    implements _$$BusStopAlertImplCopyWith<$Res> {
  __$$BusStopAlertImplCopyWithImpl(
      _$BusStopAlertImpl _value, $Res Function(_$BusStopAlertImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? tripId = null,
    Object? busStop = null,
    Object? isTriggered = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$BusStopAlertImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      busStop: null == busStop
          ? _value.busStop
          : busStop // ignore: cast_nullable_to_non_nullable
              as BusStop,
      isTriggered: null == isTriggered
          ? _value.isTriggered
          : isTriggered // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusStopAlertImpl implements _BusStopAlert {
  _$BusStopAlertImpl(
      {required this.id,
      required this.userId,
      required this.tripId,
      required this.busStop,
      required this.isTriggered,
      required this.createdAt,
      required this.updatedAt});

  factory _$BusStopAlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusStopAlertImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String tripId;
  @override
  final BusStop busStop;
  @override
  final bool isTriggered;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'BusStopAlert(id: $id, userId: $userId, tripId: $tripId, busStop: $busStop, isTriggered: $isTriggered, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusStopAlertImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.busStop, busStop) || other.busStop == busStop) &&
            (identical(other.isTriggered, isTriggered) ||
                other.isTriggered == isTriggered) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, tripId, busStop,
      isTriggered, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusStopAlertImplCopyWith<_$BusStopAlertImpl> get copyWith =>
      __$$BusStopAlertImplCopyWithImpl<_$BusStopAlertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusStopAlertImplToJson(
      this,
    );
  }
}

abstract class _BusStopAlert implements BusStopAlert {
  factory _BusStopAlert(
      {required final String id,
      required final String userId,
      required final String tripId,
      required final BusStop busStop,
      required final bool isTriggered,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$BusStopAlertImpl;

  factory _BusStopAlert.fromJson(Map<String, dynamic> json) =
      _$BusStopAlertImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get tripId;
  @override
  BusStop get busStop;
  @override
  bool get isTriggered;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$BusStopAlertImplCopyWith<_$BusStopAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
