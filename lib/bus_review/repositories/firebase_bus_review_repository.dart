import 'package:bus_saathi/bus_review/models/bus_review_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'bus_review_repository.dart';

class FirebaseBusReviewRepository extends BusReviewRepository {
  FirebaseBusReviewRepository({
    required FirebaseFirestore? firestore,
  }) : firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore firestore;

  @override
  Future<void> saveBusReview(BusReviewForm busReviewForm) async {
    await firestore.collection('busReviews').add(busReviewForm.toJson());
  }
}
