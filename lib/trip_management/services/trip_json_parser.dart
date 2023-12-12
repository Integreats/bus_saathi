import 'package:cloud_firestore/cloud_firestore.dart';

import '../../bus_routes/models/raw_bus_route.dart';
import '../../bus_stops/models/bus_stop.dart';
import '../../trip/models/trip.dart';

class TripJsonParsers {
  static List<RawBusRoute> parseRoutes(
      List<QueryDocumentSnapshot<Object?>> rawRoutesList) {
    List<RawBusRoute> routesList = [];

    for (final element in rawRoutesList) {
      final currentRouteAsJson = element.data() as Map<String, dynamic>;
      RawBusRoute currentRoute = RawBusRoute.fromJson(currentRouteAsJson);
      routesList.add(currentRoute);
    }
    return routesList;
  }

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

  static List<Trip> parseTrips(
      List<QueryDocumentSnapshot<Object?>> rawTripsList) {
    final tripsList = <Trip>[];

    for (QueryDocumentSnapshot element in rawTripsList) {
      final currentTripAsJson = element.data() as Map<String, dynamic>;

      final currentTrip = Trip.fromJson(currentTripAsJson);
      tripsList.add(currentTrip);
    }
    return tripsList;
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
