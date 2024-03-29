// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInForm _$SignInFormFromJson(Map<String, dynamic> json) {
  return _SignInForm.fromJson(json);
}

/// @nodoc
mixin _$SignInForm {
  String get emailAddress => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInFormCopyWith<SignInForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFormCopyWith<$Res> {
  factory $SignInFormCopyWith(
          SignInForm value, $Res Function(SignInForm) then) =
      _$SignInFormCopyWithImpl<$Res, SignInForm>;
  @useResult
  $Res call({String emailAddress, String password});
}

/// @nodoc
class _$SignInFormCopyWithImpl<$Res, $Val extends SignInForm>
    implements $SignInFormCopyWith<$Res> {
  _$SignInFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInFormImplCopyWith<$Res>
    implements $SignInFormCopyWith<$Res> {
  factory _$$SignInFormImplCopyWith(
          _$SignInFormImpl value, $Res Function(_$SignInFormImpl) then) =
      __$$SignInFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String emailAddress, String password});
}

/// @nodoc
class __$$SignInFormImplCopyWithImpl<$Res>
    extends _$SignInFormCopyWithImpl<$Res, _$SignInFormImpl>
    implements _$$SignInFormImplCopyWith<$Res> {
  __$$SignInFormImplCopyWithImpl(
      _$SignInFormImpl _value, $Res Function(_$SignInFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? password = null,
  }) {
    return _then(_$SignInFormImpl(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInFormImpl implements _SignInForm {
  const _$SignInFormImpl({required this.emailAddress, required this.password});

  factory _$SignInFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInFormImplFromJson(json);

  @override
  final String emailAddress;
  @override
  final String password;

  @override
  String toString() {
    return 'SignInForm(emailAddress: $emailAddress, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInFormImpl &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, emailAddress, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInFormImplCopyWith<_$SignInFormImpl> get copyWith =>
      __$$SignInFormImplCopyWithImpl<_$SignInFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInFormImplToJson(
      this,
    );
  }
}

abstract class _SignInForm implements SignInForm {
  const factory _SignInForm(
      {required final String emailAddress,
      required final String password}) = _$SignInFormImpl;

  factory _SignInForm.fromJson(Map<String, dynamic> json) =
      _$SignInFormImpl.fromJson;

  @override
  String get emailAddress;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$SignInFormImplCopyWith<_$SignInFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
