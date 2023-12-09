import 'package:cloud_firestore/cloud_firestore.dart';

import 'bus_review_repository.dart';

class FirebaseBusReviewRepository extends BusReviewRepository {
  FirebaseBusReviewRepository({
    required FirebaseFirestore? firestore,
  }) : firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore firestore;
}
