import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../models/bus_stop.dart';
import 'bus_stops_list_provider.dart';

/// Fetches the nearest bus stop from a location.
final nearbyBusStopProvider =
    Provider.family<BusStop?, ({double latitude, double longitude})>(
        (ref, coordinates) {
  final busStops = ref.watch(busStopsListProvider).value;
  if (busStops == null) return null;

  BusStop nearestStop = busStops[0];
  double nearestDistance = Geolocator.distanceBetween(
    coordinates.latitude,
    coordinates.longitude,
    nearestStop.latitude,
    nearestStop.longitude,
  );

  for (BusStop busStop in busStops) {
    double currentDistance = Geolocator.distanceBetween(
      coordinates.latitude,
      coordinates.longitude,
      busStop.latitude,
      busStop.longitude,
    );
    if (currentDistance < nearestDistance) {
      nearestStop = busStop;
      nearestDistance = currentDistance;
    }
  }

  return nearestStop;
});
