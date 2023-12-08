import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_form.freezed.dart';
part 'sign_up_form.g.dart';

@freezed
class SignUpForm with _$SignUpForm {
  const factory SignUpForm({
    required String firstName,
    required String lastName,
    required String emailAddress,
    required String password,
    required String confirmPassword,
  }) = _SignUpForm;

  factory SignUpForm.fromJson(Map<String, dynamic> json) =>
      _$SignUpFormFromJson(json);

  factory SignUpForm.empty() => const SignUpForm(
        firstName: '',
        lastName: '',
        emailAddress: '',
        password: '',
        confirmPassword: '',
      );
}
