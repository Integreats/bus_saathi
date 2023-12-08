import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/sign_in_form.dart';

final signInFormKeyProvider = Provider<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>(debugLabel: "SignInFormKey");
});

final signInFormControllerProvider =
    NotifierProvider<SignInFormController, SignInForm>(
        SignInFormController.new);

class SignInFormController extends Notifier<SignInForm> {
  GlobalKey<FormState> get _formKey => ref.watch(signInFormKeyProvider);

  @override
  SignInForm build() {
    return SignInForm.empty();
  }

  void updateEmail(String email) {
    state = state.copyWith(emailAddress: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }
}
