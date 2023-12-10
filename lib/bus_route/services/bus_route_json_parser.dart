import 'package:cloud_firestore/cloud_firestore.dart';

import '../../bus_routes/models/bus_route.dart';
import '../../bus_routes/models/raw_bus_route.dart';
import '../../bus_stops/models/bus_stop.dart';

class BusRouteJsonParsers {
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
