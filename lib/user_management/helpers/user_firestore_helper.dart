import 'package:cloud_firestore/cloud_firestore.dart';

import 'user_firestore_collections_name_helper.dart';

class UserFirestoreHelper {
  static Stream<QuerySnapshot> getTrafficControllersCollectionStream() {
    return FirebaseFirestore.instance
        .collection(UserFirestoreCollectionsNameHelper.trafficControllers)
        .orderBy('name')
        .snapshots();
  }

  static Stream<QuerySnapshot> getConductorsCollectionStream() {
    return FirebaseFirestore.instance
        .collection(UserFirestoreCollectionsNameHelper.conductors)
        .orderBy('name')
        .snapshots();
  }

  static Stream<QuerySnapshot> getParentsCollectionStream() {
    return FirebaseFirestore.instance
        .collection(UserFirestoreCollectionsNameHelper.users)
        .orderBy('name')
        .snapshots();
  }

  static CollectionReference<Map<String, dynamic>>
      get trafficControllersCollection => FirebaseFirestore.instance
          .collection(UserFirestoreCollectionsNameHelper.trafficControllers);

  static CollectionReference<Map<String, dynamic>> get conductorsCollection =>
      FirebaseFirestore.instance
          .collection(UserFirestoreCollectionsNameHelper.conductors);
}
