import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_app_provider.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  final app = ref.watch(firebaseAppProvider);
  if (app == null) {
    return FirebaseFirestore.instance;
  }
  return FirebaseFirestore.instanceFor(app: app);
});
