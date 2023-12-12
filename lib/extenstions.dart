import 'dart:math' as math;

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'bus_stops/models/bus_stop.dart';
import 'trip/models/live_location.dart';

extension LatLngExtension on LatLng {
  static LatLng fromPosition(LiveLocation position) {
    return LatLng(
      position.latitude,
      position.longitude,
    );
  }

  static LatLng midPoint(BusStop origin, BusStop destination) {
    double lat1Rad = radians(origin.latitude);
    double lon1Rad = radians(origin.longitude);
    double lat2Rad = radians(destination.latitude);
    double lon2Rad = radians(destination.longitude);

    double avgLat = (lat1Rad + lat2Rad) / 2;
    double avgLon = (lon1Rad + lon2Rad) / 2;

    double midpointLat = degrees(avgLat);
    double midpointLon = degrees(avgLon);
    return LatLng(midpointLat, midpointLon);
  }

  static double radians(double degrees) {
    return degrees * math.pi / 180;
  }

  static double degrees(double radians) {
    return radians * 180 / math.pi;
  }
}
