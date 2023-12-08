import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_app_provider.dart';

final firebaseStorageProvider = Provider<FirebaseStorage>((ref) {
  final firebaseApp = ref.watch(firebaseAppProvider);
  if (firebaseApp == null) return FirebaseStorage.instance;

  return FirebaseStorage.instanceFor(app: firebaseApp);
});
