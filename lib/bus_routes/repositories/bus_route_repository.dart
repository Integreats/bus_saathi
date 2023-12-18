import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/raw_bus_route.dart';
import 'firebase_bus_route_repository.dart';

final busRouteRepositoryProvider = Provider<BusRouteRepository>((ref) {
  return FirebaseBusRouteRepository();
});

abstract class BusRouteRepository {
  Stream<List<RawBusRoute>> getRawBusRoutesStream();
}
