import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/bus_route.dart';
import '../models/bus_stop.dart';
import '../models/raw_bus_route.dart';

class RouteJsonParsers {
  static List<RawBusRoute> parseRawBusRoutes(
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

  static List<BusRoute> parseBusRoutes(Map<String, dynamic> parameters) {
    final rawRoutesList =
        parameters['rawBusRouteDocs'] as List<QueryDocumentSnapshot<Object?>>;
    final stopMap = parameters['parsedBusStopMap'] as Map<String, BusStop>;
    List<BusRoute> routesList = [];
    for (final element in rawRoutesList) {
      final currentRouteAsJson = element.data() as Map<String, dynamic>;
      RawBusRoute currentRoute = RawBusRoute.fromJson(currentRouteAsJson);
      List<BusStop> busStopList = [];
      for (final stopId in currentRoute.stops) {
        final stop = stopMap[stopId] ?? BusStop.empty();
        busStopList.add(stop);
      }
      final convertedBusRoute = BusRoute(
        id: currentRoute.id,

        origin: stopMap[currentRoute.origin] ?? BusStop.empty(),
        destination: stopMap[currentRoute.destination] ?? BusStop.empty(),
        stops: busStopList,
        createdAt: currentRoute.createdAt,
        updatedAt: currentRoute.updatedAt,
      );
      routesList.add(convertedBusRoute);
    }
    return routesList;
  }

  static RawBusRoute parseBusRouteToRawBusRoute(BusRoute busRoute) {
    List<String> busStopIds = [];
    for (final busStop in busRoute.stops) {
      busStopIds.add(busStop.id);
    }
    return RawBusRoute(
      id: busRoute.id,

      origin: busRoute.origin.id,
      destination: busRoute.destination.id,
      stops: busStopIds,
      createdAt: busRoute.createdAt,
      updatedAt: busRoute.updatedAt,
    );
  }
}
