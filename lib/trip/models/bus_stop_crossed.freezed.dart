// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus_stop_crossed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BusStopCrossed _$BusStopCrossedFromJson(Map<String, dynamic> json) {
  return _BusStopCrossed.fromJson(json);
}

/// @nodoc
mixin _$BusStopCrossed {
  BusStop get busStop => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  DateTime get crossedDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusStopCrossedCopyWith<BusStopCrossed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusStopCrossedCopyWith<$Res> {
  factory $BusStopCrossedCopyWith(
          BusStopCrossed value, $Res Function(BusStopCrossed) then) =
      _$BusStopCrossedCopyWithImpl<$Res, BusStopCrossed>;
  @useResult
  $Res call(
      {BusStop busStop, @DateTimeJsonConverter() DateTime crossedDateTime});

  $BusStopCopyWith<$Res> get busStop;
}

/// @nodoc
class _$BusStopCrossedCopyWithImpl<$Res, $Val extends BusStopCrossed>
    implements $BusStopCrossedCopyWith<$Res> {
  _$BusStopCrossedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? busStop = null,
    Object? crossedDateTime = null,
  }) {
    return _then(_value.copyWith(
      busStop: null == busStop
          ? _value.busStop
          : busStop // ignore: cast_nullable_to_non_nullable
              as BusStop,
      crossedDateTime: null == crossedDateTime
          ? _value.crossedDateTime
          : crossedDateTime // ignore: cast_nullable_to_non_nullable
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
abstract class _$$BusStopCrossedImplCopyWith<$Res>
    implements $BusStopCrossedCopyWith<$Res> {
  factory _$$BusStopCrossedImplCopyWith(_$BusStopCrossedImpl value,
          $Res Function(_$BusStopCrossedImpl) then) =
      __$$BusStopCrossedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BusStop busStop, @DateTimeJsonConverter() DateTime crossedDateTime});

  @override
  $BusStopCopyWith<$Res> get busStop;
}

/// @nodoc
class __$$BusStopCrossedImplCopyWithImpl<$Res>
    extends _$BusStopCrossedCopyWithImpl<$Res, _$BusStopCrossedImpl>
    implements _$$BusStopCrossedImplCopyWith<$Res> {
  __$$BusStopCrossedImplCopyWithImpl(
      _$BusStopCrossedImpl _value, $Res Function(_$BusStopCrossedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? busStop = null,
    Object? crossedDateTime = null,
  }) {
    return _then(_$BusStopCrossedImpl(
      busStop: null == busStop
          ? _value.busStop
          : busStop // ignore: cast_nullable_to_non_nullable
              as BusStop,
      crossedDateTime: null == crossedDateTime
          ? _value.crossedDateTime
          : crossedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusStopCrossedImpl implements _BusStopCrossed {
  const _$BusStopCrossedImpl(
      {required this.busStop,
      @DateTimeJsonConverter() required this.crossedDateTime});

  factory _$BusStopCrossedImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusStopCrossedImplFromJson(json);

  @override
  final BusStop busStop;
  @override
  @DateTimeJsonConverter()
  final DateTime crossedDateTime;

  @override
  String toString() {
    return 'BusStopCrossed(busStop: $busStop, crossedDateTime: $crossedDateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusStopCrossedImpl &&
            (identical(other.busStop, busStop) || other.busStop == busStop) &&
            (identical(other.crossedDateTime, crossedDateTime) ||
                other.crossedDateTime == crossedDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, busStop, crossedDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusStopCrossedImplCopyWith<_$BusStopCrossedImpl> get copyWith =>
      __$$BusStopCrossedImplCopyWithImpl<_$BusStopCrossedImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusStopCrossedImplToJson(
      this,
    );
  }
}

abstract class _BusStopCrossed implements BusStopCrossed {
  const factory _BusStopCrossed(
          {required final BusStop busStop,
          @DateTimeJsonConverter() required final DateTime crossedDateTime}) =
      _$BusStopCrossedImpl;

  factory _BusStopCrossed.fromJson(Map<String, dynamic> json) =
      _$BusStopCrossedImpl.fromJson;

  @override
  BusStop get busStop;
  @override
  @DateTimeJsonConverter()
  DateTime get crossedDateTime;
  @override
  @JsonKey(ignore: true)
  _$$BusStopCrossedImplCopyWith<_$BusStopCrossedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
