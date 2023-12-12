import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../conductor/models/conductor.dart';
import '../../models/app_user.dart';
import '../../providers/firebase_providers/firebase_storage.dart';
import '../../providers/firebase_providers/firestore_provider.dart';
import 'firebase_user_management_repository.dart';

export 'firebase_user_management_repository.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final firestore = ref.watch(firestoreProvider);
  final storage = ref.watch(firebaseStorageProvider);
  return FirebaseUserManagementRepository(
    firestore: firestore,
    storage: storage,
  );
});

abstract class UserRepository {
  /// Fetches [Conductor] data from collection. Returns null if not found;
  Future<Conductor?> fetchConductor(int phoneNumber);

  /// Checks whether conudctor exists in the collection or not.
  Future<bool> conductorExists(int phoneNumber);

  Future<bool> isUserExists(String id);
  Future<AppUser> getUser(String id);
  Future<void> createUser(AppUser user);
  Future<void> updateUser(AppUser user);
  Future<void> deleteUser(AppUser user);
}
