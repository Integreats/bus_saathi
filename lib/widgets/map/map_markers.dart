import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../../bus_stops/models/bus_stop.dart';
import '../../trip/models/live_location.dart';
import '../../trip/models/trip_route.dart';

class MapMarkers {
  static late BitmapDescriptor markerIcon;
  static late BitmapDescriptor busMarkerIcon;

  static late BitmapDescriptor greenMarkerIcon;
  static late BitmapDescriptor redMarkerIcon;

  static late BitmapDescriptor greenBusStopMarkerIcon;
  static late BitmapDescriptor redBusStopMarkerIcon;
  static late BitmapDescriptor blueBusStopMarkerIcon;

  static Future<void> init() async {
    markerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "images/markers/marker.png",
    );
    busMarkerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(

      ),
      "images/markers/bus_marker.png",
    );
    greenMarkerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "images/markers/green_marker.png",
    );

    redMarkerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "images/markers/red_marker.png",
    );

    greenBusStopMarkerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "images/markers/bus_stop_green.png",
    );

    redBusStopMarkerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "images/markers/bus_stop_red.png",
    );

    blueBusStopMarkerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "images/markers/bus_stop_blue.png",
    );
  }

  static Marker getMarker(LatLng latLng) {
    return Marker(
      markerId: MarkerId("${latLng.latitude}${latLng.longitude}"),
      icon: markerIcon,
      position: latLng,
      visible: true,
      infoWindow: InfoWindow(
        title: "Latitude: ${latLng.latitude}\nLongitude: ${latLng.longitude}",
      ),
    );
  }

  static Marker getBusMarker(LiveLocation liveLocation) {
    LatLng position = LatLng(
      liveLocation.latitude,
      liveLocation.longitude,
    );
    String date = DateFormat.yMMMd().format(liveLocation.timestamp);
    String time =
        DateFormat('HH:mm:ss', "en_US").format(liveLocation.timestamp);
    return Marker(
      markerId: MarkerId("${liveLocation.latitude}${liveLocation.longitude}"),
      icon: busMarkerIcon,
      position: position,
      visible: true,
      rotation: liveLocation.heading,
      infoWindow: InfoWindow(
        title:
            "Latitude: ${liveLocation.latitude}\nLongitude: ${liveLocation.longitude}\n",
        snippet: "$date\n$time",
      ),
    );
  }

  static Marker getGreenMarker(LiveLocation initialLocation) {
    LatLng position = LatLng(
      initialLocation.latitude,
      initialLocation.longitude,
    );
    String time =
        DateFormat('HH:mm:ss', "en_US").format(initialLocation.timestamp);
    String date = DateFormat.yMMMd().format(initialLocation.timestamp);
    return Marker(
      markerId: const MarkerId("Start Position"),
      position: position,
      icon: greenMarkerIcon,
      infoWindow: InfoWindow(
        title: date,
        snippet: "    $time",
        anchor: const Offset(0.5, 0.0),
      ),
    );
  }

  static Marker getRedMarker(LiveLocation finalLocation) {
    LatLng position = LatLng(
      finalLocation.latitude,
      finalLocation.longitude,
    );
    String time =
        DateFormat('HH:mm:ss', "en_US").format(finalLocation.timestamp);
    String date = DateFormat.yMMMd().format(finalLocation.timestamp);
    return Marker(
      markerId: const MarkerId("End Position"),
      position: position,
      icon: redMarkerIcon,
      infoWindow: InfoWindow(
        title: date,
        snippet: "    $time",
        anchor: const Offset(0.5, 0.0),
      ),
    );
  }

  static Marker getOriginStopMarker(TripRoute busRoute) {
    final origin = busRoute.origin;
    return Marker(
      markerId: MarkerId(origin.id),
      icon: greenBusStopMarkerIcon,
      position: LatLng(origin.latitude, origin.longitude),
      visible: true,
      infoWindow: InfoWindow(
        title: origin.name,
      ),
    );
  }

  static Marker getDestinationStopMarker(TripRoute busRoute) {
    final destination = busRoute.destination;
    return Marker(
      markerId: MarkerId(destination.id),
      icon: redBusStopMarkerIcon,
      position: LatLng(destination.latitude, destination.longitude),
      visible: true,
      infoWindow: InfoWindow(
        title: destination.name,
      ),
    );
  }

  static Marker getBusStopMarker(BusStop busStop) {
    return Marker(
      markerId: MarkerId(busStop.id),
      icon: blueBusStopMarkerIcon,
      position: LatLng(busStop.latitude, busStop.longitude),
      visible: true,
      infoWindow: InfoWindow(
        title: busStop.name,
      ),
    );
  }
}
