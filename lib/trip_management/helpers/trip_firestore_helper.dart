import 'package:cloud_firestore/cloud_firestore.dart';

import 'trip_firestore_collections_name_helper.dart';

class TripFirestoreHelper {
  static Stream<QuerySnapshot> getBusRoutesCollectionStream() {
    return FirebaseFirestore.instance
        .collection(TripFirestoreCollectionsNameHelper.busRoutes)
        .snapshots();
  }

  static Stream<QuerySnapshot> getBusStopsCollectionStream() {
    return FirebaseFirestore.instance
        .collection(TripFirestoreCollectionsNameHelper.busStops)
        .orderBy('name')
        .snapshots();
  }

  static Stream<QuerySnapshot> getConductorCompletedTripsStream(
      int conductorPhoneNumber) {
    return FirebaseFirestore.instance
        .collection(TripFirestoreCollectionsNameHelper.trips)
        .where('conductor.phoneNumber', isEqualTo: conductorPhoneNumber)
        .where('isEnded', isEqualTo: true)
        .snapshots();
  }

  static Stream<QuerySnapshot> getActiveTripsStream() {
    return FirebaseFirestore.instance
        .collection(TripFirestoreCollectionsNameHelper.trips)
        .where('isEnded', isEqualTo: false)
        .snapshots();
  }

  static Stream<QuerySnapshot> getCompletedTripsStream() {
    return FirebaseFirestore.instance
        .collection(TripFirestoreCollectionsNameHelper.trips)
        .where('isEnded', isEqualTo: true)
        .snapshots();
  }

  static CollectionReference<Map<String, dynamic>> get busRoutesCollection =>
      FirebaseFirestore.instance
          .collection(TripFirestoreCollectionsNameHelper.busRoutes);
  static CollectionReference<Map<String, dynamic>> get busStopsCollection =>
      FirebaseFirestore.instance
          .collection(TripFirestoreCollectionsNameHelper.busStops);
}
