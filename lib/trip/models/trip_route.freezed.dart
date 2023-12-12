// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TripRoute _$TripRouteFromJson(Map<String, dynamic> json) {
  return _TripRoute.fromJson(json);
}

/// @nodoc
mixin _$TripRoute {
  String get id => throw _privateConstructorUsedError;
  BusStop get origin => throw _privateConstructorUsedError;
  BusStop get destination => throw _privateConstructorUsedError;
  List<BusStop> get stops => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripRouteCopyWith<TripRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripRouteCopyWith<$Res> {
  factory $TripRouteCopyWith(TripRoute value, $Res Function(TripRoute) then) =
      _$TripRouteCopyWithImpl<$Res, TripRoute>;
  @useResult
  $Res call(
      {String id, BusStop origin, BusStop destination, List<BusStop> stops});

  $BusStopCopyWith<$Res> get origin;
  $BusStopCopyWith<$Res> get destination;
}

/// @nodoc
class _$TripRouteCopyWithImpl<$Res, $Val extends TripRoute>
    implements $TripRouteCopyWith<$Res> {
  _$TripRouteCopyWithImpl(this._value, this._then);

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
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as BusStop,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as BusStop,
      stops: null == stops
          ? _value.stops
          : stops // ignore: cast_nullable_to_non_nullable
              as List<BusStop>,
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
abstract class _$$TripRouteImplCopyWith<$Res>
    implements $TripRouteCopyWith<$Res> {
  factory _$$TripRouteImplCopyWith(
          _$TripRouteImpl value, $Res Function(_$TripRouteImpl) then) =
      __$$TripRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, BusStop origin, BusStop destination, List<BusStop> stops});

  @override
  $BusStopCopyWith<$Res> get origin;
  @override
  $BusStopCopyWith<$Res> get destination;
}

/// @nodoc
class __$$TripRouteImplCopyWithImpl<$Res>
    extends _$TripRouteCopyWithImpl<$Res, _$TripRouteImpl>
    implements _$$TripRouteImplCopyWith<$Res> {
  __$$TripRouteImplCopyWithImpl(
      _$TripRouteImpl _value, $Res Function(_$TripRouteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? origin = null,
    Object? destination = null,
    Object? stops = null,
  }) {
    return _then(_$TripRouteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as BusStop,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as BusStop,
      stops: null == stops
          ? _value._stops
          : stops // ignore: cast_nullable_to_non_nullable
              as List<BusStop>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TripRouteImpl implements _TripRoute {
  const _$TripRouteImpl(
      {required this.id,
      required this.origin,
      required this.destination,
      required final List<BusStop> stops})
      : _stops = stops;

  factory _$TripRouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripRouteImplFromJson(json);

  @override
  final String id;
  @override
  final BusStop origin;
  @override
  final BusStop destination;
  final List<BusStop> _stops;
  @override
  List<BusStop> get stops {
    if (_stops is EqualUnmodifiableListView) return _stops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stops);
  }

  @override
  String toString() {
    return 'TripRoute(id: $id, origin: $origin, destination: $destination, stops: $stops)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripRouteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            const DeepCollectionEquality().equals(other._stops, _stops));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, origin, destination,
      const DeepCollectionEquality().hash(_stops));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TripRouteImplCopyWith<_$TripRouteImpl> get copyWith =>
      __$$TripRouteImplCopyWithImpl<_$TripRouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripRouteImplToJson(
      this,
    );
  }
}

abstract class _TripRoute implements TripRoute {
  const factory _TripRoute(
      {required final String id,
      required final BusStop origin,
      required final BusStop destination,
      required final List<BusStop> stops}) = _$TripRouteImpl;

  factory _TripRoute.fromJson(Map<String, dynamic> json) =
      _$TripRouteImpl.fromJson;

  @override
  String get id;
  @override
  BusStop get origin;
  @override
  BusStop get destination;
  @override
  List<BusStop> get stops;
  @override
  @JsonKey(ignore: true)
  _$$TripRouteImplCopyWith<_$TripRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
