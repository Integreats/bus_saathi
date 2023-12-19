import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/firebase_providers/firestore_provider.dart';
import '../models/bus_review_form.dart';
import 'firebase_bus_review_repository.dart';

final busReviewRepositoryProvider = Provider<BusReviewRepository>((ref) {
  final firestore = ref.watch(firestoreProvider);
  return FirebaseBusReviewRepository(
    firestore: firestore,
  );
});

abstract class BusReviewRepository {
  Future<void> saveBusReview(BusReviewForm busReviewForm);
}
