// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Trip _$TripFromJson(Map<String, dynamic> json) {
  return _Trip.fromJson(json);
}

/// @nodoc
mixin _$Trip {
  String get id => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  DateTime get startDateTime => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  DateTime get endDateTime => throw _privateConstructorUsedError;
  Conductor get conductor => throw _privateConstructorUsedError;
  List<LiveLocation> get liveLocation => throw _privateConstructorUsedError;
  bool get isEnded => throw _privateConstructorUsedError;
  TripRoute? get tripRoute => throw _privateConstructorUsedError;
  Map<String, BusStopCrossed>? get busStopsCrossed =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripCopyWith<Trip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripCopyWith<$Res> {
  factory $TripCopyWith(Trip value, $Res Function(Trip) then) =
      _$TripCopyWithImpl<$Res, Trip>;
  @useResult
  $Res call(
      {String id,
      @DateTimeJsonConverter() DateTime startDateTime,
      @DateTimeJsonConverter() DateTime endDateTime,
      Conductor conductor,
      List<LiveLocation> liveLocation,
      bool isEnded,
      TripRoute? tripRoute,
      Map<String, BusStopCrossed>? busStopsCrossed});

  $ConductorCopyWith<$Res> get conductor;
  $TripRouteCopyWith<$Res>? get tripRoute;
}

/// @nodoc
class _$TripCopyWithImpl<$Res, $Val extends Trip>
    implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDateTime = null,
    Object? endDateTime = null,
    Object? conductor = null,
    Object? liveLocation = null,
    Object? isEnded = null,
    Object? tripRoute = freezed,
    Object? busStopsCrossed = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startDateTime: null == startDateTime
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDateTime: null == endDateTime
          ? _value.endDateTime
          : endDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      conductor: null == conductor
          ? _value.conductor
          : conductor // ignore: cast_nullable_to_non_nullable
              as Conductor,
      liveLocation: null == liveLocation
          ? _value.liveLocation
          : liveLocation // ignore: cast_nullable_to_non_nullable
              as List<LiveLocation>,
      isEnded: null == isEnded
          ? _value.isEnded
          : isEnded // ignore: cast_nullable_to_non_nullable
              as bool,
      tripRoute: freezed == tripRoute
          ? _value.tripRoute
          : tripRoute // ignore: cast_nullable_to_non_nullable
              as TripRoute?,
      busStopsCrossed: freezed == busStopsCrossed
          ? _value.busStopsCrossed
          : busStopsCrossed // ignore: cast_nullable_to_non_nullable
              as Map<String, BusStopCrossed>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ConductorCopyWith<$Res> get conductor {
    return $ConductorCopyWith<$Res>(_value.conductor, (value) {
      return _then(_value.copyWith(conductor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TripRouteCopyWith<$Res>? get tripRoute {
    if (_value.tripRoute == null) {
      return null;
    }

    return $TripRouteCopyWith<$Res>(_value.tripRoute!, (value) {
      return _then(_value.copyWith(tripRoute: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TripImplCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$$TripImplCopyWith(
          _$TripImpl value, $Res Function(_$TripImpl) then) =
      __$$TripImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @DateTimeJsonConverter() DateTime startDateTime,
      @DateTimeJsonConverter() DateTime endDateTime,
      Conductor conductor,
      List<LiveLocation> liveLocation,
      bool isEnded,
      TripRoute? tripRoute,
      Map<String, BusStopCrossed>? busStopsCrossed});

  @override
  $ConductorCopyWith<$Res> get conductor;
  @override
  $TripRouteCopyWith<$Res>? get tripRoute;
}

/// @nodoc
class __$$TripImplCopyWithImpl<$Res>
    extends _$TripCopyWithImpl<$Res, _$TripImpl>
    implements _$$TripImplCopyWith<$Res> {
  __$$TripImplCopyWithImpl(_$TripImpl _value, $Res Function(_$TripImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDateTime = null,
    Object? endDateTime = null,
    Object? conductor = null,
    Object? liveLocation = null,
    Object? isEnded = null,
    Object? tripRoute = freezed,
    Object? busStopsCrossed = freezed,
  }) {
    return _then(_$TripImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startDateTime: null == startDateTime
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDateTime: null == endDateTime
          ? _value.endDateTime
          : endDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      conductor: null == conductor
          ? _value.conductor
          : conductor // ignore: cast_nullable_to_non_nullable
              as Conductor,
      liveLocation: null == liveLocation
          ? _value._liveLocation
          : liveLocation // ignore: cast_nullable_to_non_nullable
              as List<LiveLocation>,
      isEnded: null == isEnded
          ? _value.isEnded
          : isEnded // ignore: cast_nullable_to_non_nullable
              as bool,
      tripRoute: freezed == tripRoute
          ? _value.tripRoute
          : tripRoute // ignore: cast_nullable_to_non_nullable
              as TripRoute?,
      busStopsCrossed: freezed == busStopsCrossed
          ? _value._busStopsCrossed
          : busStopsCrossed // ignore: cast_nullable_to_non_nullable
              as Map<String, BusStopCrossed>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TripImpl implements _Trip {
  const _$TripImpl(
      {required this.id,
      @DateTimeJsonConverter() required this.startDateTime,
      @DateTimeJsonConverter() required this.endDateTime,
      required this.conductor,
      required final List<LiveLocation> liveLocation,
      required this.isEnded,
      required this.tripRoute,
      required final Map<String, BusStopCrossed>? busStopsCrossed})
      : _liveLocation = liveLocation,
        _busStopsCrossed = busStopsCrossed;

  factory _$TripImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripImplFromJson(json);

  @override
  final String id;
  @override
  @DateTimeJsonConverter()
  final DateTime startDateTime;
  @override
  @DateTimeJsonConverter()
  final DateTime endDateTime;
  @override
  final Conductor conductor;
  final List<LiveLocation> _liveLocation;
  @override
  List<LiveLocation> get liveLocation {
    if (_liveLocation is EqualUnmodifiableListView) return _liveLocation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_liveLocation);
  }

  @override
  final bool isEnded;
  @override
  final TripRoute? tripRoute;
  final Map<String, BusStopCrossed>? _busStopsCrossed;
  @override
  Map<String, BusStopCrossed>? get busStopsCrossed {
    final value = _busStopsCrossed;
    if (value == null) return null;
    if (_busStopsCrossed is EqualUnmodifiableMapView) return _busStopsCrossed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Trip(id: $id, startDateTime: $startDateTime, endDateTime: $endDateTime, conductor: $conductor, liveLocation: $liveLocation, isEnded: $isEnded, tripRoute: $tripRoute, busStopsCrossed: $busStopsCrossed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDateTime, startDateTime) ||
                other.startDateTime == startDateTime) &&
            (identical(other.endDateTime, endDateTime) ||
                other.endDateTime == endDateTime) &&
            (identical(other.conductor, conductor) ||
                other.conductor == conductor) &&
            const DeepCollectionEquality()
                .equals(other._liveLocation, _liveLocation) &&
            (identical(other.isEnded, isEnded) || other.isEnded == isEnded) &&
            (identical(other.tripRoute, tripRoute) ||
                other.tripRoute == tripRoute) &&
            const DeepCollectionEquality()
                .equals(other._busStopsCrossed, _busStopsCrossed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      startDateTime,
      endDateTime,
      conductor,
      const DeepCollectionEquality().hash(_liveLocation),
      isEnded,
      tripRoute,
      const DeepCollectionEquality().hash(_busStopsCrossed));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      __$$TripImplCopyWithImpl<_$TripImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripImplToJson(
      this,
    );
  }
}

abstract class _Trip implements Trip {
  const factory _Trip(
          {required final String id,
          @DateTimeJsonConverter() required final DateTime startDateTime,
          @DateTimeJsonConverter() required final DateTime endDateTime,
          required final Conductor conductor,
          required final List<LiveLocation> liveLocation,
          required final bool isEnded,
          required final TripRoute? tripRoute,
          required final Map<String, BusStopCrossed>? busStopsCrossed}) =
      _$TripImpl;

  factory _Trip.fromJson(Map<String, dynamic> json) = _$TripImpl.fromJson;

  @override
  String get id;
  @override
  @DateTimeJsonConverter()
  DateTime get startDateTime;
  @override
  @DateTimeJsonConverter()
  DateTime get endDateTime;
  @override
  Conductor get conductor;
  @override
  List<LiveLocation> get liveLocation;
  @override
  bool get isEnded;
  @override
  TripRoute? get tripRoute;
  @override
  Map<String, BusStopCrossed>? get busStopsCrossed;
  @override
  @JsonKey(ignore: true)
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
