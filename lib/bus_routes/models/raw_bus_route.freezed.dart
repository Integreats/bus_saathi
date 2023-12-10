// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'raw_bus_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RawBusRoute _$RawBusRouteFromJson(Map<String, dynamic> json) {
  return _RawBusRoute.fromJson(json);
}

/// @nodoc
mixin _$RawBusRoute {
  String get id => throw _privateConstructorUsedError;
  String get origin => throw _privateConstructorUsedError;
  String get destination => throw _privateConstructorUsedError;
  List<String> get stops => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RawBusRouteCopyWith<RawBusRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RawBusRouteCopyWith<$Res> {
  factory $RawBusRouteCopyWith(
          RawBusRoute value, $Res Function(RawBusRoute) then) =
      _$RawBusRouteCopyWithImpl<$Res, RawBusRoute>;
  @useResult
  $Res call(
      {String id,
      String origin,
      String destination,
      List<String> stops,
      @DateTimeJsonConverter() DateTime createdAt,
      @DateTimeJsonConverter() DateTime updatedAt});
}

/// @nodoc
class _$RawBusRouteCopyWithImpl<$Res, $Val extends RawBusRoute>
    implements $RawBusRouteCopyWith<$Res> {
  _$RawBusRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? origin = null,
    Object? destination = null,
    Object? stops = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      stops: null == stops
          ? _value.stops
          : stops // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
}

/// @nodoc
abstract class _$$RawBusRouteImplCopyWith<$Res>
    implements $RawBusRouteCopyWith<$Res> {
  factory _$$RawBusRouteImplCopyWith(
          _$RawBusRouteImpl value, $Res Function(_$RawBusRouteImpl) then) =
      __$$RawBusRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String origin,
      String destination,
      List<String> stops,
      @DateTimeJsonConverter() DateTime createdAt,
      @DateTimeJsonConverter() DateTime updatedAt});
}

/// @nodoc
class __$$RawBusRouteImplCopyWithImpl<$Res>
    extends _$RawBusRouteCopyWithImpl<$Res, _$RawBusRouteImpl>
    implements _$$RawBusRouteImplCopyWith<$Res> {
  __$$RawBusRouteImplCopyWithImpl(
      _$RawBusRouteImpl _value, $Res Function(_$RawBusRouteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? origin = null,
    Object? destination = null,
    Object? stops = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$RawBusRouteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      stops: null == stops
          ? _value._stops
          : stops // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
class _$RawBusRouteImpl implements _RawBusRoute {
  _$RawBusRouteImpl(
      {required this.id,
      required this.origin,
      required this.destination,
      required final List<String> stops,
      @DateTimeJsonConverter() required this.createdAt,
      @DateTimeJsonConverter() required this.updatedAt})
      : _stops = stops;

  factory _$RawBusRouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$RawBusRouteImplFromJson(json);

  @override
  final String id;
  @override
  final String origin;
  @override
  final String destination;
  final List<String> _stops;
  @override
  List<String> get stops {
    if (_stops is EqualUnmodifiableListView) return _stops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stops);
  }

  @override
  @DateTimeJsonConverter()
  final DateTime createdAt;
  @override
  @DateTimeJsonConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'RawBusRoute(id: $id, origin: $origin, destination: $destination, stops: $stops, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RawBusRouteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            const DeepCollectionEquality().equals(other._stops, _stops) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, origin, destination,
      const DeepCollectionEquality().hash(_stops), createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RawBusRouteImplCopyWith<_$RawBusRouteImpl> get copyWith =>
      __$$RawBusRouteImplCopyWithImpl<_$RawBusRouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RawBusRouteImplToJson(
      this,
    );
  }
}

abstract class _RawBusRoute implements RawBusRoute {
  factory _RawBusRoute(
          {required final String id,
          required final String origin,
          required final String destination,
          required final List<String> stops,
          @DateTimeJsonConverter() required final DateTime createdAt,
          @DateTimeJsonConverter() required final DateTime updatedAt}) =
      _$RawBusRouteImpl;

  factory _RawBusRoute.fromJson(Map<String, dynamic> json) =
      _$RawBusRouteImpl.fromJson;

  @override
  String get id;
  @override
  String get origin;
  @override
  String get destination;
  @override
  List<String> get stops;
  @override
  @DateTimeJsonConverter()
  DateTime get createdAt;
  @override
  @DateTimeJsonConverter()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$RawBusRouteImplCopyWith<_$RawBusRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
