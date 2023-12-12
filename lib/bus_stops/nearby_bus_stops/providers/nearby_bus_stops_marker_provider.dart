import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../widgets/map/map_markers.dart';
import '../../models/bus_stop.dart';
import 'nearby_bus_stops_provider.dart';

final busStopsMarkerProvider =
    Provider.family<Set<Marker>, ({LatLng center, double radius})>(
        (ref, geoData) {
  final nearbyBusStops = ref.watch(nearbyBusStopsProvider((geoData)));
  final busStopMarkers = <Marker>{};
  for (BusStop busStop in nearbyBusStops) {
    busStopMarkers.add(MapMarkers.getBusStopMarker(busStop));
  }
  return busStopMarkers;
});
