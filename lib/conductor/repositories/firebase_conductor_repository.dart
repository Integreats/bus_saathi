import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/conductor.dart';
import 'conductor_repository.dart';

class FirebaseConductorRepository extends ConductorRepository {
  FirebaseConductorRepository({
    required FirebaseFirestore? firestore,
    required FirebaseStorage? storage,
  })  : firestore = firestore ?? FirebaseFirestore.instance,
        storage = storage ?? FirebaseStorage.instance;

  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  CollectionReference<Map<String, dynamic>> get conductorsCollection =>
      firestore.collection('conductors');

  /// Query to find conductor through phoneNumber.
  Query<Map<String, dynamic>> conductorQuery(int phoneNumber) =>
      conductorsCollection.where(
        'phoneNumber',
        isEqualTo: phoneNumber,
      );

  Reference get conductorImagesReference => storage.ref('images/conductors');

  @override
  Future<bool> conductorExists(int phoneNumber) async {
    final conductorResults = await conductorQuery(phoneNumber).get();
    return conductorResults.size == 1;
  }

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
  Future<void> addConductor(Conductor conductor) async {
    final updatedConductor = await uploadConductorImage(conductor);
    return await conductorsCollection
        .doc(updatedConductor.id)
        .set(updatedConductor.toJson());
  }

  @override
  Future<void> updateConductor(Conductor conductor) async {
    final updatedConductor = await uploadConductorImage(conductor);
    await conductorsCollection
        .doc(updatedConductor.id)
        .update(updatedConductor.copyWith(updatedAt: DateTime.now()).toJson());
  }

  @override
  Future<void> deleteConductor(Conductor conductor) async {
    final conductorImage = conductorImagesReference.child(conductor.id);
    await conductorImage.delete();
    await conductorsCollection.doc(conductor.id).delete();
  }

  @override
  Future<Conductor> uploadConductorImage(Conductor conductor) async {
    if (conductor.profilePicture == null) {
      return conductor;
    } else {
      final metadata = SettableMetadata(contentType: "image/jpeg");
      final storageImagePath = conductorImagesReference.child(conductor.id);
      try {
        await storageImagePath.putFile(
            File(conductor.profilePicture!), metadata);
      } finally {}
      final downloadprofilePicture = await storageImagePath.getDownloadURL();
      conductor = conductor.copyWith(profilePicture: downloadprofilePicture);
      return conductor;
    }
  }
}
