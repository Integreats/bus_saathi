import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_form.freezed.dart';
part 'sign_in_form.g.dart';

@freezed
class SignInForm with _$SignInForm {
  const factory SignInForm({
    required String emailAddress,
    required String password,
  }) = _SignInForm;

  factory SignInForm.fromJson(Map<String, dynamic> json) =>
      _$SignInFormFromJson(json);

  factory SignInForm.empty() => const SignInForm(
        emailAddress: '',
        password: '',
      );
}
