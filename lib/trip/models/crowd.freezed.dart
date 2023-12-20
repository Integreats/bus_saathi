// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crowd.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Crowd _$CrowdFromJson(Map<String, dynamic> json) {
  return _Crowd.fromJson(json);
}

/// @nodoc
mixin _$Crowd {
  @JsonKey(name: 'chair count')
  int get chairCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'person count')
  int get personCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CrowdCopyWith<Crowd> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrowdCopyWith<$Res> {
  factory $CrowdCopyWith(Crowd value, $Res Function(Crowd) then) =
      _$CrowdCopyWithImpl<$Res, Crowd>;
  @useResult
  $Res call(
      {@JsonKey(name: 'chair count') int chairCount,
      @JsonKey(name: 'person count') int personCount});
}

/// @nodoc
class _$CrowdCopyWithImpl<$Res, $Val extends Crowd>
    implements $CrowdCopyWith<$Res> {
  _$CrowdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chairCount = null,
    Object? personCount = null,
  }) {
    return _then(_value.copyWith(
      chairCount: null == chairCount
          ? _value.chairCount
          : chairCount // ignore: cast_nullable_to_non_nullable
              as int,
      personCount: null == personCount
          ? _value.personCount
          : personCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrowdImplCopyWith<$Res> implements $CrowdCopyWith<$Res> {
  factory _$$CrowdImplCopyWith(
          _$CrowdImpl value, $Res Function(_$CrowdImpl) then) =
      __$$CrowdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'chair count') int chairCount,
      @JsonKey(name: 'person count') int personCount});
}

/// @nodoc
class __$$CrowdImplCopyWithImpl<$Res>
    extends _$CrowdCopyWithImpl<$Res, _$CrowdImpl>
    implements _$$CrowdImplCopyWith<$Res> {
  __$$CrowdImplCopyWithImpl(
      _$CrowdImpl _value, $Res Function(_$CrowdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chairCount = null,
    Object? personCount = null,
  }) {
    return _then(_$CrowdImpl(
      chairCount: null == chairCount
          ? _value.chairCount
          : chairCount // ignore: cast_nullable_to_non_nullable
              as int,
      personCount: null == personCount
          ? _value.personCount
          : personCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CrowdImpl implements _Crowd {
  _$CrowdImpl(
      {@JsonKey(name: 'chair count') required this.chairCount,
      @JsonKey(name: 'person count') required this.personCount});

  factory _$CrowdImpl.fromJson(Map<String, dynamic> json) =>
      _$$CrowdImplFromJson(json);

  @override
  @JsonKey(name: 'chair count')
  final int chairCount;
  @override
  @JsonKey(name: 'person count')
  final int personCount;

  @override
  String toString() {
    return 'Crowd(chairCount: $chairCount, personCount: $personCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrowdImpl &&
            (identical(other.chairCount, chairCount) ||
                other.chairCount == chairCount) &&
            (identical(other.personCount, personCount) ||
                other.personCount == personCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, chairCount, personCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrowdImplCopyWith<_$CrowdImpl> get copyWith =>
      __$$CrowdImplCopyWithImpl<_$CrowdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CrowdImplToJson(
      this,
    );
  }
}

abstract class _Crowd implements Crowd {
  factory _Crowd(
          {@JsonKey(name: 'chair count') required final int chairCount,
          @JsonKey(name: 'person count') required final int personCount}) =
      _$CrowdImpl;

  factory _Crowd.fromJson(Map<String, dynamic> json) = _$CrowdImpl.fromJson;

  @override
  @JsonKey(name: 'chair count')
  int get chairCount;
  @override
  @JsonKey(name: 'person count')
  int get personCount;
  @override
  @JsonKey(ignore: true)
  _$$CrowdImplCopyWith<_$CrowdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
