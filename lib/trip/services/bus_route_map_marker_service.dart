import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../bus_routes/models/bus_route.dart';
import '../../themes/custom_colors.dart';
import '../../widgets/map/map_markers.dart';

class BusRouteMapMarkerService {
  BusRouteMapMarkerService({
    required this.busRoute,
  });

  final BusRoute busRoute;


  ({Polyline tripRoutePolyline, Set<Marker> busStopsMarkers})
      plotRouteMarkersPolylines() {
    Polyline tripRouteLine = const Polyline(
      polylineId: PolylineId('busRoute'),
      color: CustomColors.deepBlue,
      jointType: JointType.round,
      width: 5,
    );

    List<LatLng> coordinates = [];
    Set<Marker> markers = {};

    /// Adding orgin bus stop marker
    coordinates
        .add(LatLng(busRoute.origin.latitude, busRoute.origin.longitude));
    markers.add(MapMarkers.getOriginStopMarker(busRoute.origin));

    /// Adding bus stops' markers
    for (final busStop in busRoute.stops) {
      LatLng coordinate = LatLng(busStop.latitude, busStop.longitude);
      coordinates.add(coordinate);
      markers.add(MapMarkers.getBusStopMarker(busStop));
    }

    // Adding destination bus stop marker
    coordinates.add(
        LatLng(busRoute.destination.latitude, busRoute.destination.longitude));
    markers.add(MapMarkers.getDestinationStopMarker(busRoute.destination));

    tripRouteLine = tripRouteLine.copyWith(pointsParam: coordinates);

    return (
      tripRoutePolyline: tripRouteLine,
      busStopsMarkers: markers,
    );
  }
}
