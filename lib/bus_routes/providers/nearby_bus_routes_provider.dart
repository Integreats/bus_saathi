import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bus_stops/providers/nearby_bus_stop_provider.dart';
import '../models/bus_route.dart';
import 'bus_routes_list_provider.dart';

final nearbyBusRoutesProvider =
    Provider.family<List<BusRoute>, ({double latitude, double longitude})>(
        (ref, coordinates) {
  final busRoutes = ref.watch(busRoutesListProvider).value;

  if (busRoutes == null) return [];
  final nearbyBusStop = ref.watch(nearbyBusStopProvider(coordinates));

  List<BusRoute> nearbyBusRoutes = [];

  for (BusRoute busRoute in busRoutes) {
    if (busRoute.stops.contains(nearbyBusStop) ||
        busRoute.origin.id == nearbyBusStop?.id ||
        busRoute.destination.id == nearbyBusStop?.id) {
      nearbyBusRoutes.add(busRoute);
    }
  }
  return nearbyBusRoutes;
});
