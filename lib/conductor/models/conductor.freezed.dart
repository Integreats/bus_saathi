// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conductor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Conductor _$ConductorFromJson(Map<String, dynamic> json) {
  return _Conductor.fromJson(json);
}

/// @nodoc
mixin _$Conductor {
  String get id => throw _privateConstructorUsedError;
  String get busId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get phoneNumber => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConductorCopyWith<Conductor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConductorCopyWith<$Res> {
  factory $ConductorCopyWith(Conductor value, $Res Function(Conductor) then) =
      _$ConductorCopyWithImpl<$Res, Conductor>;
  @useResult
  $Res call(
      {String id,
      String busId,
      String name,
      int phoneNumber,
      String? profilePicture,
      Gender gender,
      @DateTimeJsonConverter() DateTime createdAt,
      @DateTimeJsonConverter() DateTime updatedAt});
}

/// @nodoc
class _$ConductorCopyWithImpl<$Res, $Val extends Conductor>
    implements $ConductorCopyWith<$Res> {
  _$ConductorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? busId = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? profilePicture = freezed,
    Object? gender = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      busId: null == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as int,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
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
abstract class _$$ConductorImplCopyWith<$Res>
    implements $ConductorCopyWith<$Res> {
  factory _$$ConductorImplCopyWith(
          _$ConductorImpl value, $Res Function(_$ConductorImpl) then) =
      __$$ConductorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String busId,
      String name,
      int phoneNumber,
      String? profilePicture,
      Gender gender,
      @DateTimeJsonConverter() DateTime createdAt,
      @DateTimeJsonConverter() DateTime updatedAt});
}

/// @nodoc
class __$$ConductorImplCopyWithImpl<$Res>
    extends _$ConductorCopyWithImpl<$Res, _$ConductorImpl>
    implements _$$ConductorImplCopyWith<$Res> {
  __$$ConductorImplCopyWithImpl(
      _$ConductorImpl _value, $Res Function(_$ConductorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? busId = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? profilePicture = freezed,
    Object? gender = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ConductorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      busId: null == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as int,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
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
class _$ConductorImpl implements _Conductor {
  const _$ConductorImpl(
      {required this.id,
      required this.busId,
      required this.name,
      required this.phoneNumber,
      required this.profilePicture,
      required this.gender,
      @DateTimeJsonConverter() required this.createdAt,
      @DateTimeJsonConverter() required this.updatedAt});

  factory _$ConductorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConductorImplFromJson(json);

  @override
  final String id;
  @override
  final String busId;
  @override
  final String name;
  @override
  final int phoneNumber;
  @override
  final String? profilePicture;
  @override
  final Gender gender;
  @override
  @DateTimeJsonConverter()
  final DateTime createdAt;
  @override
  @DateTimeJsonConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Conductor(id: $id, busId: $busId, name: $name, phoneNumber: $phoneNumber, profilePicture: $profilePicture, gender: $gender, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConductorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.busId, busId) || other.busId == busId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, busId, name, phoneNumber,
      profilePicture, gender, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConductorImplCopyWith<_$ConductorImpl> get copyWith =>
      __$$ConductorImplCopyWithImpl<_$ConductorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConductorImplToJson(
      this,
    );
  }
}

abstract class _Conductor implements Conductor {
  const factory _Conductor(
          {required final String id,
          required final String busId,
          required final String name,
          required final int phoneNumber,
          required final String? profilePicture,
          required final Gender gender,
          @DateTimeJsonConverter() required final DateTime createdAt,
          @DateTimeJsonConverter() required final DateTime updatedAt}) =
      _$ConductorImpl;

  factory _Conductor.fromJson(Map<String, dynamic> json) =
      _$ConductorImpl.fromJson;

  @override
  String get id;
  @override
  String get busId;
  @override
  String get name;
  @override
  int get phoneNumber;
  @override
  String? get profilePicture;
  @override
  Gender get gender;
  @override
  @DateTimeJsonConverter()
  DateTime get createdAt;
  @override
  @DateTimeJsonConverter()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ConductorImplCopyWith<_$ConductorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
