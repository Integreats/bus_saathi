import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_app_provider.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  final app = ref.watch(firebaseAppProvider);
  if (app == null) {
    return FirebaseAuth.instance;
  }
  return FirebaseAuth.instanceFor(app: app);
});
