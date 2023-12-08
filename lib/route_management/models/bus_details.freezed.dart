// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BusDetails _$BusDetailsFromJson(Map<String, dynamic> json) {
  return _BusDetails.fromJson(json);
}

/// @nodoc
mixin _$BusDetails {
  String get id => throw _privateConstructorUsedError;
  String get numberPlateNumber => throw _privateConstructorUsedError;
  String get busIdentifier => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusDetailsCopyWith<BusDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusDetailsCopyWith<$Res> {
  factory $BusDetailsCopyWith(
          BusDetails value, $Res Function(BusDetails) then) =
      _$BusDetailsCopyWithImpl<$Res, BusDetails>;
  @useResult
  $Res call(
      {String id,
      String numberPlateNumber,
      String busIdentifier,
      @DateTimeJsonConverter() DateTime createdAt,
      @DateTimeJsonConverter() DateTime updatedAt});
}

/// @nodoc
class _$BusDetailsCopyWithImpl<$Res, $Val extends BusDetails>
    implements $BusDetailsCopyWith<$Res> {
  _$BusDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? numberPlateNumber = null,
    Object? busIdentifier = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      numberPlateNumber: null == numberPlateNumber
          ? _value.numberPlateNumber
          : numberPlateNumber // ignore: cast_nullable_to_non_nullable
              as String,
      busIdentifier: null == busIdentifier
          ? _value.busIdentifier
          : busIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$BusDetailsImplCopyWith<$Res>
    implements $BusDetailsCopyWith<$Res> {
  factory _$$BusDetailsImplCopyWith(
          _$BusDetailsImpl value, $Res Function(_$BusDetailsImpl) then) =
      __$$BusDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String numberPlateNumber,
      String busIdentifier,
      @DateTimeJsonConverter() DateTime createdAt,
      @DateTimeJsonConverter() DateTime updatedAt});
}

/// @nodoc
class __$$BusDetailsImplCopyWithImpl<$Res>
    extends _$BusDetailsCopyWithImpl<$Res, _$BusDetailsImpl>
    implements _$$BusDetailsImplCopyWith<$Res> {
  __$$BusDetailsImplCopyWithImpl(
      _$BusDetailsImpl _value, $Res Function(_$BusDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? numberPlateNumber = null,
    Object? busIdentifier = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$BusDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      numberPlateNumber: null == numberPlateNumber
          ? _value.numberPlateNumber
          : numberPlateNumber // ignore: cast_nullable_to_non_nullable
              as String,
      busIdentifier: null == busIdentifier
          ? _value.busIdentifier
          : busIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$BusDetailsImpl implements _BusDetails {
  const _$BusDetailsImpl(
      {required this.id,
      required this.numberPlateNumber,
      required this.busIdentifier,
      @DateTimeJsonConverter() required this.createdAt,
      @DateTimeJsonConverter() required this.updatedAt});

  factory _$BusDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusDetailsImplFromJson(json);

  @override
  final String id;
  @override
  final String numberPlateNumber;
  @override
  final String busIdentifier;
  @override
  @DateTimeJsonConverter()
  final DateTime createdAt;
  @override
  @DateTimeJsonConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'BusDetails(id: $id, numberPlateNumber: $numberPlateNumber, busIdentifier: $busIdentifier, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.numberPlateNumber, numberPlateNumber) ||
                other.numberPlateNumber == numberPlateNumber) &&
            (identical(other.busIdentifier, busIdentifier) ||
                other.busIdentifier == busIdentifier) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, numberPlateNumber, busIdentifier, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusDetailsImplCopyWith<_$BusDetailsImpl> get copyWith =>
      __$$BusDetailsImplCopyWithImpl<_$BusDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusDetailsImplToJson(
      this,
    );
  }
}

abstract class _BusDetails implements BusDetails {
  const factory _BusDetails(
          {required final String id,
          required final String numberPlateNumber,
          required final String busIdentifier,
          @DateTimeJsonConverter() required final DateTime createdAt,
          @DateTimeJsonConverter() required final DateTime updatedAt}) =
      _$BusDetailsImpl;

  factory _BusDetails.fromJson(Map<String, dynamic> json) =
      _$BusDetailsImpl.fromJson;

  @override
  String get id;
  @override
  String get numberPlateNumber;
  @override
  String get busIdentifier;
  @override
  @DateTimeJsonConverter()
  DateTime get createdAt;
  @override
  @DateTimeJsonConverter()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$BusDetailsImplCopyWith<_$BusDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
