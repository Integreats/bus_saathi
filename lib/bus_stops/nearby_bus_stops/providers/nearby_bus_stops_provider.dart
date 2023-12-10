import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/bus_stop.dart';
import '../../providers/bus_stops_list_provider.dart';

final nearbyBusStopsProvider =
    Provider.family<List<BusStop>, ({LatLng center, double radius})>(
        (ref, geoData) {
  final busStopsList = ref.watch(busStopsListProvider).value;

  if (busStopsList == null) {
    return [];
  }

  final List<BusStop> nearbyBusStops = [];

  for (final busStop in busStopsList) {
    final distance = Geolocator.distanceBetween(
      busStop.latitude,
      busStop.longitude,
      geoData.center.latitude,
      geoData.center.longitude,
    );
    if (distance <= geoData.radius) {
      nearbyBusStops.add(busStop);
    }
  }

  return nearbyBusStops;
});
