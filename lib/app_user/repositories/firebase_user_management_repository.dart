import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../models/app_user.dart';
import '../../user_management/conductor/models/conductor.dart';
import 'user_repository.dart';

class FirebaseUserManagementRepository extends UserRepository {
  FirebaseUserManagementRepository({
    required FirebaseFirestore? firestore,
    required FirebaseStorage? storage,
  })  : firestore = firestore ?? FirebaseFirestore.instance,
        storage = storage ?? FirebaseStorage.instance;

  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  CollectionReference<Map<String, dynamic>> get conductorsCollection =>
      firestore.collection('conductors');

  CollectionReference<Map<String, dynamic>> get usersCollection =>
      firestore.collection('users');

  /// Query to find conductor through phoneNumber.
  Query<Map<String, dynamic>> conductorQuery(int phoneNumber) =>
      conductorsCollection.where(
        'phoneNumber',
        isEqualTo: phoneNumber,
      );

  @override
  Future<Conductor?> fetchConductor(int phoneNumber) async {
    final conductorResults = await conductorQuery(phoneNumber).get();

    if (conductorResults.size == 1) {
      final rawData = conductorResults.docs.first.data();
      final conductor = Conductor.fromJson(rawData);
      return conductor;
    }

    return null;
  }

  @override
  Future<bool> conductorExists(int phoneNumber) async {
    final conductorResults = await conductorQuery(phoneNumber).get();
    return conductorResults.size == 1;
  }

  @override
  Future<void> createUser(AppUser user) async {
    await usersCollection.doc(user.id).set(user.toJson());

    return;
  }

  @override
  Future<void> deleteUser(AppUser user) async {
    await usersCollection.doc(user.id).delete();
    return;
  }

  @override
  Future<AppUser> getUser(String id) async {
    final user = await usersCollection.doc(id).get();
    return AppUser.fromJson(user.data()!);
  }

  @override
  Future<void> updateUser(AppUser user) async {
    await usersCollection.doc(user.id).update(user.toJson());
  }

  @override
  Future<bool> isUserExists(String id) async {
    final doc = await usersCollection.doc(id).get();
    return doc.exists;
  }
}
