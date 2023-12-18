import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bus_stops/models/bus_stop.dart';
import '../../bus_stops/providers/bus_stops_list_provider.dart';
import '../models/bus_route.dart';
import '../repositories/bus_route_repository.dart';

final busRoutesListProvider = StreamProvider<List<BusRoute>>((ref) async* {
  final busStopsList = ref.watch(busStopsListProvider).value;
  if (busStopsList != null && busStopsList.isNotEmpty) {
    final busRouteRepository = ref.watch(busRouteRepositoryProvider);
    final rawBusRouteStream = busRouteRepository.getRawBusRoutesStream();
    await for (final rawBusRoutes in rawBusRouteStream) {
      final List<BusRoute> busRoutes = [];
      for (final rawBusRoute in rawBusRoutes) {
        final origin = busStopsList.firstWhere(
          (busStop) => busStop.id == rawBusRoute.origin,
        );
        final destination = busStopsList.firstWhere(
          (busStop) => busStop.id == rawBusRoute.destination,
        );
        final List<BusStop> busStops = [];
        for (final busStopId in rawBusRoute.stops) {
          final busStop = busStopsList.firstWhere(
            (busStop) => busStop.id == busStopId,
          );
          busStops.add(busStop);
        }
        busRoutes.add(
          BusRoute(
            id: rawBusRoute.id,
            routeNumber: rawBusRoute.routeNumber,
            direction: rawBusRoute.direction,
            origin: origin,
            stops: busStops,
            destination: destination,
            createdAt: rawBusRoute.createdAt,
            updatedAt: rawBusRoute.updatedAt,
          ),
        );
      }
      yield busRoutes;
    }
  }
});
