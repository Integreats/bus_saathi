import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/bus_route.dart';
import 'bus_routes_list_provider.dart';

final busRouteProvider = Provider.family<BusRoute?, String>((ref, busRouteId) {
  final busRoutes = ref.watch(busRoutesListProvider).value;
  if (busRoutes == null) return null;

  final busRoute = busRoutes.firstWhere((element) => element.id == busRouteId);
  return busRoute;
});
