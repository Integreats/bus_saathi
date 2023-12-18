import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/bus_route.dart';
import 'bus_routes_list_provider.dart';

final busRouteByRouteNumberProvider =
    Provider.family<BusRoute?, String>((ref, routeNumber) {
  final busRoutes = ref.watch(busRoutesListProvider).value;
  if (busRoutes == null) return null;

  for (final busRoute in busRoutes) {
    if (busRoute.routeNumber == routeNumber) {
      return busRoute;
    }
  }
  return null;
});
