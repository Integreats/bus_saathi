import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/bus_stop.dart';

class BusStopJsonParser {
  static List<BusStop> parseStops(
      List<QueryDocumentSnapshot<Object?>> rawStopsList) {
    List<BusStop> stopsList = [];

    for (QueryDocumentSnapshot element in rawStopsList) {
      final currentStopAsJson = element.data() as Map<String, dynamic>;

      BusStop currentStop = BusStop.fromJson(currentStopAsJson);
      stopsList.add(currentStop);
    }
    return stopsList;
  }

  static Map<String, BusStop> parseStopsMap(
      List<QueryDocumentSnapshot<Object?>> rawStopsList) {
    Map<String, BusStop> busStopMap = {};

    for (QueryDocumentSnapshot element in rawStopsList) {
      final currentBusStopAsJson = element.data() as Map<String, dynamic>;
      final currentBusStop = BusStop.fromJson(currentBusStopAsJson);
      busStopMap[currentBusStop.id] = currentBusStop;
    }
    return busStopMap;
  }
}
