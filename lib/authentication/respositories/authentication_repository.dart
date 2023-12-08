import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/firebase_providers/firebase_auth_provider.dart';
import 'firebase_authentication_repository.dart';

final authenticationRepositoryProvider =
    Provider<AuthenticationRepository>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return FirebaseAuthenticationRepository(
    firebaseAuth: firebaseAuth,
  );
});

abstract class AuthenticationRepository {
  User? get user;
  Future<bool> get isLinkedToGoogle;
  Future<bool> get isLinkedToPassword;

  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<User?> signUpWithEmailAndPassword(
      {required String email, required String password});
  Future<void> linkToPassword(String password);
  Future<void> forgotPassword(String email);
  Future<User?> signInWithGoogle();
  Future<void> linkWithGoogle();
  Future<User> unlinkGoogleProvider();

  Future<void> signOut();
}
