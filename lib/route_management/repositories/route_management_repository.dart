import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/firebase_providers/firestore_provider.dart';
import '../models/bus_route.dart';
import '../models/bus_stop.dart';
import 'firebase_route_management_repository.dart';

final routeManagementRepositoryProvider =
    Provider<RouteManagementRepository>((ref) {
  final firestore = ref.watch(firestoreProvider);
  return FirebaseRouteManagementRepository(
    firestore: firestore,
  );
});

abstract class RouteManagementRepository {
  Future<void> addRoute(BusRoute busRoute);
  Future<void> deleteRoute(BusRoute busRoute);
  Future<void> updateRoute(BusRoute busRoute);

  Future<void> addStop(BusStop busStop);
  Future<void> updateStop(BusStop busStop);
  Future<void> deleteStop(BusStop busStop);
}
