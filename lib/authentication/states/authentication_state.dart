import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationState {}

class UserDoesNotExistsState extends AuthenticationState {
  UserDoesNotExistsState({
    this.parent,
  });

  final User? parent;

  String get message {
    return parent != null
        ? '${parent!.phoneNumber} does not exists as parent!'
        : 'This Number does not exists as a Parent';
  }
}
