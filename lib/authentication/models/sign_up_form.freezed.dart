// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignUpForm _$SignUpFormFromJson(Map<String, dynamic> json) {
  return _SignUpForm.fromJson(json);
}

/// @nodoc
mixin _$SignUpForm {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  int? get phoneNumber => throw _privateConstructorUsedError;
  String get emailAddress => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpFormCopyWith<SignUpForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpFormCopyWith<$Res> {
  factory $SignUpFormCopyWith(
          SignUpForm value, $Res Function(SignUpForm) then) =
      _$SignUpFormCopyWithImpl<$Res, SignUpForm>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      int? phoneNumber,
      String emailAddress,
      String password,
      String confirmPassword});
}

/// @nodoc
class _$SignUpFormCopyWithImpl<$Res, $Val extends SignUpForm>
    implements $SignUpFormCopyWith<$Res> {
  _$SignUpFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? phoneNumber = freezed,
    Object? emailAddress = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpFormImplCopyWith<$Res>
    implements $SignUpFormCopyWith<$Res> {
  factory _$$SignUpFormImplCopyWith(
          _$SignUpFormImpl value, $Res Function(_$SignUpFormImpl) then) =
      __$$SignUpFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      int? phoneNumber,
      String emailAddress,
      String password,
      String confirmPassword});
}

/// @nodoc
class __$$SignUpFormImplCopyWithImpl<$Res>
    extends _$SignUpFormCopyWithImpl<$Res, _$SignUpFormImpl>
    implements _$$SignUpFormImplCopyWith<$Res> {
  __$$SignUpFormImplCopyWithImpl(
      _$SignUpFormImpl _value, $Res Function(_$SignUpFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? phoneNumber = freezed,
    Object? emailAddress = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$SignUpFormImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpFormImpl implements _SignUpForm {
  const _$SignUpFormImpl(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.emailAddress,
      required this.password,
      required this.confirmPassword});

  factory _$SignUpFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpFormImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final int? phoneNumber;
  @override
  final String emailAddress;
  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'SignUpForm(firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, emailAddress: $emailAddress, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpFormImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, phoneNumber,
      emailAddress, password, confirmPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpFormImplCopyWith<_$SignUpFormImpl> get copyWith =>
      __$$SignUpFormImplCopyWithImpl<_$SignUpFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpFormImplToJson(
      this,
    );
  }
}

abstract class _SignUpForm implements SignUpForm {
  const factory _SignUpForm(
      {required final String firstName,
      required final String lastName,
      required final int? phoneNumber,
      required final String emailAddress,
      required final String password,
      required final String confirmPassword}) = _$SignUpFormImpl;

  factory _SignUpForm.fromJson(Map<String, dynamic> json) =
      _$SignUpFormImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  int? get phoneNumber;
  @override
  String get emailAddress;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  @JsonKey(ignore: true)
  _$$SignUpFormImplCopyWith<_$SignUpFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
