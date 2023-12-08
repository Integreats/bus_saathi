import 'package:cloud_firestore/cloud_firestore.dart';

import 'route_firestore_collections_name_helper.dart';

class RouteFirestoreHelper {
  static Stream<QuerySnapshot> getBusRoutesCollectionStream() {
    return FirebaseFirestore.instance
        .collection(RouteFirestoreCollectionsNameHelper.busRoutes)
        .orderBy('updatedAt')
        .snapshots();
  }

  static Stream<QuerySnapshot> getBusStopsCollectionStream() {
    return FirebaseFirestore.instance
        .collection(RouteFirestoreCollectionsNameHelper.busStops)
        .orderBy('name')
        .snapshots();
  }

  static CollectionReference<Map<String, dynamic>> get busRoutesCollection =>
      FirebaseFirestore.instance
          .collection(RouteFirestoreCollectionsNameHelper.busRoutes);
  static CollectionReference<Map<String, dynamic>> get busStopsCollection =>
      FirebaseFirestore.instance
          .collection(RouteFirestoreCollectionsNameHelper.busStops);
}
