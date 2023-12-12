import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/firebase_providers/firebase_storage.dart';
import '../../providers/firebase_providers/firestore_provider.dart';
import '../models/conductor.dart';
import 'firebase_conductor_repository.dart';

final conductorRepositoryProvider = Provider<ConductorRepository>((ref) {
  final firestore = ref.watch(firestoreProvider);
  final storage = ref.watch(firebaseStorageProvider);
  return FirebaseConductorRepository(
    firestore: firestore,
    storage: storage,
  );
});

abstract class ConductorRepository {
  /// Fetches [Conductor] data from collection. Returns null if not found;
  Future<Conductor?> fetchConductor(int phoneNumber);

  /// Checks whether conudctor exists in the collection or not.
  Future<bool> conductorExists(int phoneNumber);

  /// Add conductor to collection.
  Future<void> addConductor(Conductor conductor);

  /// Updates conductor details.
  Future<void> updateConductor(Conductor conductor);

  /// Deletes conductor.
  Future<void> deleteConductor(Conductor conductor);

  ///Uploads the conductorImage
  Future<Conductor> uploadConductorImage(Conductor conductor);
}
