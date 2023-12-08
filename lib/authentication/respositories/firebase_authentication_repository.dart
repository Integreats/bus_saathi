import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'authentication_repository.dart';

class FirebaseAuthenticationRepository extends AuthenticationRepository {
  FirebaseAuthenticationRepository({
    required this.firebaseAuth,
  });

  final FirebaseAuth firebaseAuth;

  @override
  User? get user => firebaseAuth.currentUser;

  @override
  Future<bool> get isLinkedToGoogle async {
    final List<String> providersList = await firebaseAuth
        .fetchSignInMethodsForEmail(firebaseAuth.currentUser!.email!);
    return providersList.contains("google.com");
  }

  @override
  Future<bool> get isLinkedToPassword async {
    final List<String> providersList = await firebaseAuth
        .fetchSignInMethodsForEmail(firebaseAuth.currentUser!.email!);
    return providersList.contains("password");
  }

  final GoogleSignIn googleSignIn =
      GoogleSignIn(forceCodeForRefreshToken: true);

  @override
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final credential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return credential.user;
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return credential.user;
  }

  @override
  Future<User?> signInWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = kIsWeb
        ? await (googleSignIn.signInSilently())
        : await (googleSignIn.signIn());

    if (kIsWeb && googleSignInAccount == null) {
      googleSignInAccount = await (googleSignIn.signIn());
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleSignInAccount?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential = await firebaseAuth.signInWithCredential(credential);
    return userCredential.user;
  }

  @override
  Future<void> linkWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      await firebaseAuth.currentUser!.linkWithCredential(credential);
    }
  }

  @override
  Future<void> linkToPassword(String password) async {
    await firebaseAuth.currentUser!.updatePassword(password);
  }

  @override
  Future<void> forgotPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }
  

  @override
  Future<User> unlinkGoogleProvider() async {
    return await firebaseAuth.currentUser!.unlink('google.com');
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
    return;
  }
}
