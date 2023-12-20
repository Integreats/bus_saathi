import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../app_user/models/app_user.dart';
import '../models/emergency_contact.dart';
import 'sos_repository.dart';

class FirebaseSosRepository implements SosRepository {
  FirebaseSosRepository({
    required this.appUser,
    required FirebaseFirestore? firestore,
    required FirebaseStorage? storage,
  })  : firestore = firestore ?? FirebaseFirestore.instance,
        storage = storage ?? FirebaseStorage.instance;

  final AppUser? appUser;
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  // CollectionReference<Map<String, dynamic>> get sosCollection =>
  //     firestore.collection('sos');

  CollectionReference<Map<String, dynamic>> get emergencyContactsCollection =>
      firestore.collection('emergencyContacts');

  // @override
  // Future<bool> SosExists(int phoneNumber) async {
  //   final SosResults = await SosQuery(phoneNumber).get();
  //   return SosResults.size == 1;
  // }

  // @override
  // Future<Sos?> fetchSos(int phoneNumber) async {
  //   final SosResults = await SosQuery(phoneNumber).get();

  //   if (SosResults.size == 1) {
  //     final rawData = SosResults.docs.first.data();
  //     final Sos = Sos.fromJson(rawData);
  //     return Sos;
  //   }

  //   return null;
  // }

  // @override
  // Future<Sos> uploadSosImage(Sos Sos) async {
  //   if (Sos.profilePicture == null) {
  //     return Sos;
  //   } else {
  //     final metadata = SettableMetadata(contentType: "image/jpeg");
  //     final storageImagePath = SosImagesReference.child(Sos.id);
  //     try {
  //       await storageImagePath.putFile(File(Sos.profilePicture!), metadata);
  //     } finally {}
  //     final downloadprofilePicture = await storageImagePath.getDownloadURL();
  //     Sos = Sos.copyWith(profilePicture: downloadprofilePicture);
  //     return Sos;
  //   }
  // }

  // @override
  // Future<void> addSos(Sos Sos) async {
  //   final updatedSos = await uploadSosImage(Sos);
  //   return await sosCollection.doc(updatedSos.id).set(updatedSos.toJson());
  // }

  // @override
  // Future<void> updateSos(Sos Sos) async {
  //   final updatedSos = await uploadSosImage(Sos);
  //   await sosCollection.doc(updatedSos.id).update(updatedSos
  //       .copyWith(
  //         updatedAt: DateTime.now(),
  //       )
  //       .toJson());
  // }

  // @override
  // Future<void> deleteSos(Sos Sos) async {
  //   final imageReference = SosImagesReference.child(Sos.id);
  //   await imageReference.delete();
  //   await sosCollection.doc(Sos.id).delete();
  // }

  @override
  Future<void> addEmergencyContact(EmergencyContact emergencyContact) async {
    return await emergencyContactsCollection
        .doc(emergencyContact.id)
        .set(emergencyContact.toJson());
  }

  @override
  Future<void> updateEmergencyContact(EmergencyContact emergencyContact) async {
    await emergencyContactsCollection
        .doc(emergencyContact.id)
        .update(emergencyContact
            .copyWith(
              updatedAt: DateTime.now(),
            )
            .toJson());
  }

  @override
  Future<void> deleteEmergencyContact(EmergencyContact emergencyContact) async {
    await emergencyContactsCollection.doc(emergencyContact.id).delete();
  }

  @override
  Stream<List<EmergencyContact>> getEmergencyContactsList() async* {
    print(appUser!.id);
    final contactsStream = emergencyContactsCollection
        .where('userId', isEqualTo: appUser!.id)
        .snapshots();

    await for (final contacts in contactsStream) {
      final contactsList = contacts.docs
          .map((e) => EmergencyContact.fromJson(e.data()))
          .toList();
      yield contactsList;
    }
  }
}
