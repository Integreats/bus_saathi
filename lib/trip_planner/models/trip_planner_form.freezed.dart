// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_planner_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TripPlannerForm _$TripPlannerFormFromJson(Map<String, dynamic> json) {
  return _TripPlannerForm.fromJson(json);
}

/// @nodoc
mixin _$TripPlannerForm {
  BusStop get origin => throw _privateConstructorUsedError;
  BusStop get destination => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripPlannerFormCopyWith<TripPlannerForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripPlannerFormCopyWith<$Res> {
  factory $TripPlannerFormCopyWith(
          TripPlannerForm value, $Res Function(TripPlannerForm) then) =
      _$TripPlannerFormCopyWithImpl<$Res, TripPlannerForm>;
  @useResult
  $Res call({BusStop origin, BusStop destination});

  $BusStopCopyWith<$Res> get origin;
  $BusStopCopyWith<$Res> get destination;
}

/// @nodoc
class _$TripPlannerFormCopyWithImpl<$Res, $Val extends TripPlannerForm>
    implements $TripPlannerFormCopyWith<$Res> {
  _$TripPlannerFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = null,
    Object? destination = null,
  }) {
    return _then(_value.copyWith(
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as BusStop,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as BusStop,
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
abstract class _$$TripPlannerFormImplCopyWith<$Res>
    implements $TripPlannerFormCopyWith<$Res> {
  factory _$$TripPlannerFormImplCopyWith(_$TripPlannerFormImpl value,
          $Res Function(_$TripPlannerFormImpl) then) =
      __$$TripPlannerFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BusStop origin, BusStop destination});

  @override
  $BusStopCopyWith<$Res> get origin;
  @override
  $BusStopCopyWith<$Res> get destination;
}

/// @nodoc
class __$$TripPlannerFormImplCopyWithImpl<$Res>
    extends _$TripPlannerFormCopyWithImpl<$Res, _$TripPlannerFormImpl>
    implements _$$TripPlannerFormImplCopyWith<$Res> {
  __$$TripPlannerFormImplCopyWithImpl(
      _$TripPlannerFormImpl _value, $Res Function(_$TripPlannerFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = null,
    Object? destination = null,
  }) {
    return _then(_$TripPlannerFormImpl(
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as BusStop,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as BusStop,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TripPlannerFormImpl implements _TripPlannerForm {
  _$TripPlannerFormImpl({required this.origin, required this.destination});

  factory _$TripPlannerFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripPlannerFormImplFromJson(json);

  @override
  final BusStop origin;
  @override
  final BusStop destination;

  @override
  String toString() {
    return 'TripPlannerForm(origin: $origin, destination: $destination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripPlannerFormImpl &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, origin, destination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TripPlannerFormImplCopyWith<_$TripPlannerFormImpl> get copyWith =>
      __$$TripPlannerFormImplCopyWithImpl<_$TripPlannerFormImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripPlannerFormImplToJson(
      this,
    );
  }
}

abstract class _TripPlannerForm implements TripPlannerForm {
  factory _TripPlannerForm(
      {required final BusStop origin,
      required final BusStop destination}) = _$TripPlannerFormImpl;

  factory _TripPlannerForm.fromJson(Map<String, dynamic> json) =
      _$TripPlannerFormImpl.fromJson;

  @override
  BusStop get origin;
  @override
  BusStop get destination;
  @override
  @JsonKey(ignore: true)
  _$$TripPlannerFormImplCopyWith<_$TripPlannerFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
