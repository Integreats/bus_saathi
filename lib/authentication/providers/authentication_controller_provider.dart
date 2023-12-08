import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../respositories/authentication_repository.dart';
import 'sign_in_form_controller_provider.dart';
import 'sign_up_form_controller.dart';

final authenticationControllerProvider =
    AsyncNotifierProvider<AuthenticationController, User?>(
        AuthenticationController.new);

class AuthenticationController extends AsyncNotifier<User?> {
  AuthenticationRepository get _authenticationRepository =>
      ref.watch(authenticationRepositoryProvider);

  GlobalKey<FormState> get _signInFormKey => ref.watch(signInFormKeyProvider);
  GlobalKey<FormState> get _signUpFormKey => ref.watch(signUpFormKeyProvider);

  @override
  Future<User?> build() async {
    final user = _authenticationRepository.user;

    return user;
  }

  Future<void> signInWithEmailAndPassword() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      _signInFormKey.currentState!.save();
      if (!_signInFormKey.currentState!.validate()) {
        return state.value;
      }
      final signInForm = ref.read(signInFormControllerProvider);
      if (signInForm.emailAddress.isEmpty || signInForm.password.isEmpty) {
        throw Exception("Email or password cannot be empty.");
      }
      final user = await _authenticationRepository.signInWithEmailAndPassword(
        email: signInForm.emailAddress,
        password: signInForm.password,
      );

      return user;
    });
  }

  Future<void> signUpWithEmailAndPassword() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      _signUpFormKey.currentState!.save();
      if (!_signUpFormKey.currentState!.validate()) {
        return state.value;
      }
      final signUpForm = ref.read(signUpFormControllerProvider);
      final user = await _authenticationRepository.signUpWithEmailAndPassword(
        email: signUpForm.emailAddress,
        password: signUpForm.password,
      );

      return user;
    });
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final user = await _authenticationRepository.signInWithGoogle();

      return user;
    });
  }

  Future<void> linkWithGoogle() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await _authenticationRepository.linkWithGoogle();

      return null;
    });
  }

  Future<void> unlinkGoogleProvider() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await _authenticationRepository.unlinkGoogleProvider();

      return null;
    });
  }

  Future<void> forgotPassword() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final email = ref.read(signInFormControllerProvider).emailAddress;
      if (email.isEmpty) {
        throw Exception("Email cannot be empty.");
      }
      await _authenticationRepository.forgotPassword(email);

      return null;
    });
  }

  Future<void> linkToPassword(String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      if (password.isEmpty) {
        throw Exception("Password cannot be empty.");
      }
      await _authenticationRepository.linkToPassword(password);

      return null;
    });
  }

  Future<bool> isLinkedToGoogle() async {
    return await _authenticationRepository.isLinkedToGoogle;
  }

  Future<bool> isLinkedToPassword() async {
    return await _authenticationRepository.isLinkedToPassword;
  }

  Future<void> signOut() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await _authenticationRepository.signOut();
      return null;
    });
  }
}
