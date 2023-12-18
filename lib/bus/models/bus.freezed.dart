// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Bus _$BusFromJson(Map<String, dynamic> json) {
  return _Bus.fromJson(json);
}

/// @nodoc
mixin _$Bus {
  String get id => throw _privateConstructorUsedError;
  String get routeNumber => throw _privateConstructorUsedError;
  String get licensePlateNumber => throw _privateConstructorUsedError;
  EnergySource get energySource => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusCopyWith<Bus> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusCopyWith<$Res> {
  factory $BusCopyWith(Bus value, $Res Function(Bus) then) =
      _$BusCopyWithImpl<$Res, Bus>;
  @useResult
  $Res call(
      {String id,
      String routeNumber,
      String licensePlateNumber,
      EnergySource energySource,
      int capacity,
      String model,
      String? imageUrl,
      @DateTimeJsonConverter() DateTime createdAt,
      @DateTimeJsonConverter() DateTime updatedAt});
}

/// @nodoc
class _$BusCopyWithImpl<$Res, $Val extends Bus> implements $BusCopyWith<$Res> {
  _$BusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeNumber = null,
    Object? licensePlateNumber = null,
    Object? energySource = null,
    Object? capacity = null,
    Object? model = null,
    Object? imageUrl = freezed,
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
      licensePlateNumber: null == licensePlateNumber
          ? _value.licensePlateNumber
          : licensePlateNumber // ignore: cast_nullable_to_non_nullable
              as String,
      energySource: null == energySource
          ? _value.energySource
          : energySource // ignore: cast_nullable_to_non_nullable
              as EnergySource,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$BusImplCopyWith<$Res> implements $BusCopyWith<$Res> {
  factory _$$BusImplCopyWith(_$BusImpl value, $Res Function(_$BusImpl) then) =
      __$$BusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String routeNumber,
      String licensePlateNumber,
      EnergySource energySource,
      int capacity,
      String model,
      String? imageUrl,
      @DateTimeJsonConverter() DateTime createdAt,
      @DateTimeJsonConverter() DateTime updatedAt});
}

/// @nodoc
class __$$BusImplCopyWithImpl<$Res> extends _$BusCopyWithImpl<$Res, _$BusImpl>
    implements _$$BusImplCopyWith<$Res> {
  __$$BusImplCopyWithImpl(_$BusImpl _value, $Res Function(_$BusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeNumber = null,
    Object? licensePlateNumber = null,
    Object? energySource = null,
    Object? capacity = null,
    Object? model = null,
    Object? imageUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$BusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      routeNumber: null == routeNumber
          ? _value.routeNumber
          : routeNumber // ignore: cast_nullable_to_non_nullable
              as String,
      licensePlateNumber: null == licensePlateNumber
          ? _value.licensePlateNumber
          : licensePlateNumber // ignore: cast_nullable_to_non_nullable
              as String,
      energySource: null == energySource
          ? _value.energySource
          : energySource // ignore: cast_nullable_to_non_nullable
              as EnergySource,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$BusImpl implements _Bus {
  const _$BusImpl(
      {required this.id,
      required this.routeNumber,
      required this.licensePlateNumber,
      required this.energySource,
      required this.capacity,
      required this.model,
      required this.imageUrl,
      @DateTimeJsonConverter() required this.createdAt,
      @DateTimeJsonConverter() required this.updatedAt});

  factory _$BusImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusImplFromJson(json);

  @override
  final String id;
  @override
  final String routeNumber;
  @override
  final String licensePlateNumber;
  @override
  final EnergySource energySource;
  @override
  final int capacity;
  @override
  final String model;
  @override
  final String? imageUrl;
  @override
  @DateTimeJsonConverter()
  final DateTime createdAt;
  @override
  @DateTimeJsonConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Bus(id: $id, routeNumber: $routeNumber, licensePlateNumber: $licensePlateNumber, energySource: $energySource, capacity: $capacity, model: $model, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.routeNumber, routeNumber) ||
                other.routeNumber == routeNumber) &&
            (identical(other.licensePlateNumber, licensePlateNumber) ||
                other.licensePlateNumber == licensePlateNumber) &&
            (identical(other.energySource, energySource) ||
                other.energySource == energySource) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
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
      licensePlateNumber,
      energySource,
      capacity,
      model,
      imageUrl,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusImplCopyWith<_$BusImpl> get copyWith =>
      __$$BusImplCopyWithImpl<_$BusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusImplToJson(
      this,
    );
  }
}

abstract class _Bus implements Bus {
  const factory _Bus(
      {required final String id,
      required final String routeNumber,
      required final String licensePlateNumber,
      required final EnergySource energySource,
      required final int capacity,
      required final String model,
      required final String? imageUrl,
      @DateTimeJsonConverter() required final DateTime createdAt,
      @DateTimeJsonConverter() required final DateTime updatedAt}) = _$BusImpl;

  factory _Bus.fromJson(Map<String, dynamic> json) = _$BusImpl.fromJson;

  @override
  String get id;
  @override
  String get routeNumber;
  @override
  String get licensePlateNumber;
  @override
  EnergySource get energySource;
  @override
  int get capacity;
  @override
  String get model;
  @override
  String? get imageUrl;
  @override
  @DateTimeJsonConverter()
  DateTime get createdAt;
  @override
  @DateTimeJsonConverter()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$BusImplCopyWith<_$BusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
