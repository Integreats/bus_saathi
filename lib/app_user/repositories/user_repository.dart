import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/firebase_providers/firebase_storage.dart';
import '../../providers/firebase_providers/firestore_provider.dart';
import '../models/app_user.dart';
import 'firebase_user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final firestore = ref.watch(firestoreProvider);
  final storage = ref.watch(firebaseStorageProvider);
  return FirebaseUserRepository(firestore: firestore, storage: storage);
});

abstract class UserRepository {
  Future<AppUser?> getUser(String id);
  Future<void> createUser(AppUser appUser);
  Future<bool> isUserExists(String id);

  Future<void> updateFcmToken({
    required String id,
    required String? fcmToken,
  });
}
