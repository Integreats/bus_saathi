import 'package:bus_saathi/app_user/providers/app_user_controller_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/firebase_providers/firebase_storage.dart';
import '../../providers/firebase_providers/firestore_provider.dart';
import '../models/emergency_contact.dart';
import 'firebase_sos_repository.dart';

final sosRepositoryProvider = Provider<SosRepository>((ref) {
  final firestore = ref.watch(firestoreProvider);
  final storage = ref.watch(firebaseStorageProvider);
  final appUser = ref.watch(appUserControllerProvider).value;
  return FirebaseSosRepository(
    firestore: firestore,
    storage: storage,
    appUser: appUser,
  );
});

abstract class SosRepository {
  Stream<List<EmergencyContact>> getEmergencyContactsList();
  Future<void> addEmergencyContact(EmergencyContact emergencyContact);
  Future<void> updateEmergencyContact(EmergencyContact emergencyContact);
  Future<void> deleteEmergencyContact(EmergencyContact emergencyContact);
}
