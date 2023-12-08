import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/sign_up_form.dart';

final signUpFormKeyProvider = Provider<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>(debugLabel: "SignUpFormKey");
});

final signUpFormControllerProvider =
    NotifierProvider<SignUpFormController, SignUpForm>(
        SignUpFormController.new);

class SignUpFormController extends Notifier<SignUpForm> {
  @override
  build() {
    return SignUpForm.empty();
  }

  void updateFirstName(String firstName) {
    state = state.copyWith(firstName: firstName);
  }

  void updateLastName(String lastName) {
    state = state.copyWith(lastName: lastName);
  }

  void updateEmail(String email) {
    state = state.copyWith(emailAddress: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  void updateConfirmPassword(String confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
  }
}
