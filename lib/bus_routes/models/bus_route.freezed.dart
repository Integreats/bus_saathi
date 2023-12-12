// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BusRoute _$BusRouteFromJson(Map<String, dynamic> json) {
  return _BusRoute.fromJson(json);
}

/// @nodoc
mixin _$BusRoute {
  String get id => throw _privateConstructorUsedError;
  String get routeNumber => throw _privateConstructorUsedError;
  RouteDirection get direction => throw _privateConstructorUsedError;
  BusStop get origin => throw _privateConstructorUsedError;
  List<BusStop> get stops => throw _privateConstructorUsedError;
  BusStop get destination => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusRouteCopyWith<BusRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusRouteCopyWith<$Res> {
  factory $BusRouteCopyWith(BusRoute value, $Res Function(BusRoute) then) =
      _$BusRouteCopyWithImpl<$Res, BusRoute>;
  @useResult
  $Res call(
      {String id,
      String routeNumber,
      RouteDirection direction,
      BusStop origin,
      List<BusStop> stops,
      BusStop destination,
      @DateTimeJsonConverter() DateTime createdAt,
      @DateTimeJsonConverter() DateTime updatedAt});

  $BusStopCopyWith<$Res> get origin;
  $BusStopCopyWith<$Res> get destination;
}

/// @nodoc
class _$BusRouteCopyWithImpl<$Res, $Val extends BusRoute>
    implements $BusRouteCopyWith<$Res> {
  _$BusRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeNumber = null,
    Object? direction = null,
    Object? origin = null,
    Object? stops = null,
    Object? destination = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      routeNumber: null == routeNumber
          ? _value.routeNumber
          : routeNumber // ignore: cast_nullable_to_non_nullable
              as String,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as RouteDirection,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as BusStop,
      stops: null == stops
          ? _value.stops
          : stops // ignore: cast_nullable_to_non_nullable
              as List<BusStop>,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as BusStop,
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
  $BusStopCopyWith<$Res> get origin {
    return $BusStopCopyWith<$Res>(_value.origin, (value) {
      return _then(_value.copyWith(origin: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BusStopCopyWith<$Res> get destination {
    return $BusStopCopyWith<$Res>(_value.destination, (value) {
      return _then(_value.copyWith(destination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BusRouteImplCopyWith<$Res>
    implements $BusRouteCopyWith<$Res> {
  factory _$$BusRouteImplCopyWith(
          _$BusRouteImpl value, $Res Function(_$BusRouteImpl) then) =
      __$$BusRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String routeNumber,
      RouteDirection direction,
      BusStop origin,
      List<BusStop> stops,
      BusStop destination,
      @DateTimeJsonConverter() DateTime createdAt,
      @DateTimeJsonConverter() DateTime updatedAt});

  @override
  $BusStopCopyWith<$Res> get origin;
  @override
  $BusStopCopyWith<$Res> get destination;
}

/// @nodoc
class __$$BusRouteImplCopyWithImpl<$Res>
    extends _$BusRouteCopyWithImpl<$Res, _$BusRouteImpl>
    implements _$$BusRouteImplCopyWith<$Res> {
  __$$BusRouteImplCopyWithImpl(
      _$BusRouteImpl _value, $Res Function(_$BusRouteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeNumber = null,
    Object? direction = null,
    Object? origin = null,
    Object? stops = null,
    Object? destination = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$BusRouteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      routeNumber: null == routeNumber
          ? _value.routeNumber
          : routeNumber // ignore: cast_nullable_to_non_nullable
              as String,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as RouteDirection,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as BusStop,
      stops: null == stops
          ? _value._stops
          : stops // ignore: cast_nullable_to_non_nullable
              as List<BusStop>,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as BusStop,
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
class _$BusRouteImpl implements _BusRoute {
  _$BusRouteImpl(
      {required this.id,
      required this.routeNumber,
      required this.direction,
      required this.origin,
      required final List<BusStop> stops,
      required this.destination,
      @DateTimeJsonConverter() required this.createdAt,
      @DateTimeJsonConverter() required this.updatedAt})
      : _stops = stops;

  factory _$BusRouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusRouteImplFromJson(json);

  @override
  final String id;
  @override
  final String routeNumber;
  @override
  final RouteDirection direction;
  @override
  final BusStop origin;
  final List<BusStop> _stops;
  @override
  List<BusStop> get stops {
    if (_stops is EqualUnmodifiableListView) return _stops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stops);
  }

  @override
  final BusStop destination;
  @override
  @DateTimeJsonConverter()
  final DateTime createdAt;
  @override
  @DateTimeJsonConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'BusRoute(id: $id, routeNumber: $routeNumber, direction: $direction, origin: $origin, stops: $stops, destination: $destination, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusRouteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.routeNumber, routeNumber) ||
                other.routeNumber == routeNumber) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            const DeepCollectionEquality().equals(other._stops, _stops) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      routeNumber,
      direction,
      origin,
      const DeepCollectionEquality().hash(_stops),
      destination,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusRouteImplCopyWith<_$BusRouteImpl> get copyWith =>
      __$$BusRouteImplCopyWithImpl<_$BusRouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusRouteImplToJson(
      this,
    );
  }
}

abstract class _BusRoute implements BusRoute {
  factory _BusRoute(
          {required final String id,
          required final String routeNumber,
          required final RouteDirection direction,
          required final BusStop origin,
          required final List<BusStop> stops,
          required final BusStop destination,
          @DateTimeJsonConverter() required final DateTime createdAt,
          @DateTimeJsonConverter() required final DateTime updatedAt}) =
      _$BusRouteImpl;

  factory _BusRoute.fromJson(Map<String, dynamic> json) =
      _$BusRouteImpl.fromJson;

  @override
  String get id;
  @override
  String get routeNumber;
  @override
  RouteDirection get direction;
  @override
  BusStop get origin;
  @override
  List<BusStop> get stops;
  @override
  BusStop get destination;
  @override
  @DateTimeJsonConverter()
  DateTime get createdAt;
  @override
  @DateTimeJsonConverter()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$BusRouteImplCopyWith<_$BusRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
