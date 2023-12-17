import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/app_user.dart';
import 'user_repository.dart';

class FirebaseUserRepository extends UserRepository {
  FirebaseUserRepository({
    required FirebaseFirestore? firestore,
    required FirebaseStorage? storage,
  })  : firestore = firestore ?? FirebaseFirestore.instance,
        storage = storage ?? FirebaseStorage.instance;

  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  CollectionReference<Map<String, dynamic>> get usersCollection =>
      firestore.collection('users');

  @override
  Future<AppUser?> getUser(String id) async {
    final userSnapshot = (await usersCollection.doc(id).get());
    if (!userSnapshot.exists) return null;
    final parsedAppUser = AppUser.fromJson(userSnapshot.data()!);
    return parsedAppUser;
  }

  @override
  Future<bool> isUserExists(String id) async {
    final userSnapshot = (await usersCollection.doc(id).get());
    if (!userSnapshot.exists) return false;
    return true;
  }

  @override
  Future<void> createUser(AppUser appUser) async {
    await usersCollection.doc(appUser.id).set(appUser.toJson());
  }

  @override
  Future<void> updateFcmToken(
      {required String id, required String? fcmToken}) async {
    await usersCollection.doc(id).update({
      'fcmToken': fcmToken,
    });
  }
}
