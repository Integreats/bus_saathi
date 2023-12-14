import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bus_routes/models/route_direction.dart';
import '../models/trip.dart';
import '../repositories/trip_repository.dart';

final runningTripsStreamProvider = StreamProvider.autoDispose
    .family<List<Trip>, ({String routeNumber, RouteDirection routeDirection})>(
        (ref, routeInfo) async* {
  final tripsRepository = ref.read(tripRepositoryProvider);

  final tripsStream = tripsRepository.getTripsStream(
    routeNumber: routeInfo.routeNumber,
    routeDirection: routeInfo.routeDirection,
    activeTripsOnly: true,
  );

  await for (final trips in tripsStream) {
    print(trips);
    yield trips;
  }
});
