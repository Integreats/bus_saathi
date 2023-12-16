import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/raw_bus_route.dart';
import 'bus_route_repository.dart';

class FirebaseBusRouteRepository extends BusRouteRepository {
  FirebaseBusRouteRepository({
    FirebaseFirestore? firestore,
  }) : firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore firestore;

  CollectionReference<Map<String, dynamic>> get busRoutesCollection =>
      firestore.collection('busRoutes');

  @override
  Stream<List<RawBusRoute>> getRawBusRoutesStream() async* {
    final busRoutesStream = busRoutesCollection.snapshots();

    busRoutesCollection.orderBy('updatedAt').snapshots();

    await for (final busRoutes in busRoutesStream) {
      final List<RawBusRoute> rawBusRoutesList = [];
      for (final busRoute in busRoutes.docs) {
        final parsedRawBusRoute = RawBusRoute.fromJson(busRoute.data());
        rawBusRoutesList.add(parsedRawBusRoute);
      }
      yield rawBusRoutesList;
    }
  }
}
