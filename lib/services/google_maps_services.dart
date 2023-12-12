import 'dart:ui';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';

import '../extenstions.dart';
import '../themes/custom_colors.dart';
import '../trip/models/trip.dart';
import '../trip_management/models/live_location.dart';

class GoogleMapsServices {
  static LiveLocation getCurrentPosition(Trip currentTrip) {
    return currentTrip.liveLocation.first;
  }

  static List<LatLng> getPolyLines(Trip currentTrip) {
    return currentTrip.liveLocation
        .map((LiveLocation position) => LatLngExtension.fromPosition(position))
        .toList();
  }

  static CameraPosition getInitialCameraPosition(LiveLocation currentPosition) {
    return CameraPosition(
      target: LatLng(
        currentPosition.latitude,
        currentPosition.longitude,
      ),
      zoom: 18.00,
    );
  }

  static Polyline generatePolyLine(Trip tripData) {
    return Polyline(
      polylineId: const PolylineId('trip'),
      color: const Color.fromARGB(255, 233, 69, 170),
      width: 2,
      jointType: JointType.round,
      geodesic: true,
      points: GoogleMapsServices.getPolyLines(tripData),
    );
  }

  static Polyline generateRoutePolyLine(List<String> polylines) {
    List<LatLng> points = [];
    List<List<num>> coordinates = [];
    for (String polyline in polylines) {
      coordinates += decodePolyline(polyline);
    }
    for (List<num> coordinate in coordinates) {
      points.add(
        LatLng(
          coordinate[0].toDouble(),
          coordinate[1].toDouble(),
        ),
      );
    }
    return Polyline(
      polylineId: const PolylineId("route"),
      color: CustomColors.deepBlue,
      width: 3,
      jointType: JointType.round,
      geodesic: true,
      points: points,
    );
  }

  static bool tripStatus(Trip tripData) {
    return tripData.endDateTime.isAfter(DateTime.now());
  }
}
