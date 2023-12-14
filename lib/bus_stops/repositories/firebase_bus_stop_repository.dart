import 'package:bus_saathi/bus_stops/models/bus_stop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'bus_stop_repository.dart';

class FirebaseBusStopRepository extends BusStopRepository {
  FirebaseBusStopRepository({
    required FirebaseFirestore? firestore,
  }) : firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore firestore;

  CollectionReference<Map<String, dynamic>> get busStopsCollection =>
      firestore.collection('busStops');

  @override
  Stream<List<BusStop>> getBusStopsListStream() async* {
    final busStopsStream = busStopsCollection.orderBy('name').snapshots();

    await for (final busStops in busStopsStream) {
      final List<BusStop> busStopsList = [];
      for (final busStop in busStops.docs) {
        final parsedBusStop = BusStop.fromJson(busStop.data());
        busStopsList.add(parsedBusStop);
      }
      yield busStopsList;
    }
  }
}
