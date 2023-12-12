import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../themes/custom_colors.dart';
import '../../widgets/map/map_markers.dart';
import '../models/trip.dart';
import '../models/trip_route.dart';

class TripMapMarkerService {
  TripMapMarkerService({
    required this.trip,
  });

  final Trip? trip;

  TripRoute? get tripRoute => trip?.tripRoute;

  Marker? get busMarker {
    if (trip == null) return null;
    return MapMarkers.getBusMarker(trip!.liveLocation.first);
  }

  ({Polyline tripRoutePolyline, Set<Marker> busStopsMarkers})
      plotRouteMarkersPolylines() {
    Polyline tripRouteLine = const Polyline(
      polylineId: PolylineId('tripRoute'),
      color: CustomColors.deepBlue,
      jointType: JointType.round,
      width: 5,
    );

    if (tripRoute == null) {
      return (
        tripRoutePolyline: tripRouteLine,
        busStopsMarkers: {},
      );
    }

    List<LatLng> coordinates = [];
    Set<Marker> markers = {};

    /// Adding orgin bus stop marker
    coordinates
        .add(LatLng(tripRoute!.origin.latitude, tripRoute!.origin.longitude));
    markers.add(MapMarkers.getOriginStopMarker(tripRoute!));

    /// Adding bus stops' markers
    for (final busStop in tripRoute!.stops) {
      LatLng coordinate = LatLng(busStop.latitude, busStop.longitude);
      coordinates.add(coordinate);
      markers.add(MapMarkers.getBusStopMarker(busStop));
    }

    // Adding destination bus stop marker
    coordinates.add(LatLng(
        tripRoute!.destination.latitude, tripRoute!.destination.longitude));
    markers.add(MapMarkers.getDestinationStopMarker(tripRoute!));

    tripRouteLine = tripRouteLine.copyWith(pointsParam: coordinates);

    return (
      tripRoutePolyline: tripRouteLine,
      busStopsMarkers: markers,
    );
  }
}
