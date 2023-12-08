import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_app_provider.dart';

final firebaseAnalyticsProvider = Provider<FirebaseAnalytics>((ref) {
  final app = ref.watch(firebaseAppProvider);
  if (app == null) {
    return FirebaseAnalytics.instance;
  }
  return FirebaseAnalytics.instanceFor(app: app);
});
