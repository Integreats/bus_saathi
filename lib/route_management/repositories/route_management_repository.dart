import 'package:riverpod/riverpod.dart';

import '../models/bus_route.dart';
import '../models/bus_stop.dart';
import 'firebase_route_management_repository.dart';

final routeManagementRepositoryProvider =
    Provider<RouteManagementRepository>((ref) {
  return FirebaseRouteManagementRepository();
});

abstract class RouteManagementRepository {
  Future<void> addRoute(BusRoute busRoute);
  Future<void> deleteRoute(BusRoute busRoute);
  Future<void> updateRoute(BusRoute busRoute);

  Future<void> addStop(BusStop busStop);
  Future<void> updateStop(BusStop busStop);
  Future<void> deleteStop(BusStop busStop);
}
