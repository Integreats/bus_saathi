import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extenstions.dart';
import '../../providers/current_trip_stream_provider.dart';
import '../../providers/trip_status_provider.dart';
import '../../route_management/models/bus_stop.dart';
import '../../services/google_maps_services.dart';
import '../../themes/custom_colors.dart';
import '../../trip_management/models/live_location.dart';
import '../../trip_management/models/trip.dart';
import '../../trip_management/models/trip_route.dart';
import '../buttons/relocate_focus_button.dart';
import '../google_maps_marker.dart';

class MobileMap extends StatefulHookConsumerWidget {
  const MobileMap({super.key});

  @override
  ConsumerState<MobileMap> createState() => _MobileMapState();
}

class _MobileMapState extends ConsumerState<MobileMap> {
  GoogleMapController? googleMapController;
  late LiveLocation currentPosition;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Trip? currentTrip;
  late Set<Polyline> polylines;
  Polyline routeLine = const Polyline(
    polylineId: PolylineId('busRoute'),
    color: CustomColors.deepBlue,
    jointType: JointType.round,
    width: 5,
  );
  Set<Marker> stopsMarkers = {};
  @override
  void initState() {
    super.initState();
    MapMarker.init();
    polylines = {};

    currentPosition = LiveLocation.empty().copyWith(
      latitude: 12.9402458,
      longitude: 77.583654,
      speed: 0,
      timestamp: DateTime.now(),
    );
  }

  @override
  void dispose() {
    googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    final currentTripStream = ref.watch(currentTripStreamProvider);
    // final List<String> encodedPolyline = ref.watch(routeServiceProvider).encodedPolylines;
    return SizedBox(
      height: deviceSize.height - (deviceSize.height / 2.75),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(27),
              bottomRight: Radius.circular(27),
            ),
            child: currentTripStream.when(
              data: (tripData) {
                currentPosition =
                    GoogleMapsServices.getCurrentPosition(tripData);
                if (tripData.tripRoute != null) {
                  plotRouteMarkersPolylines(tripData.tripRoute!);
                }
                if (googleMapController != null) {
                  googleMapController!.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: LatLngExtension.fromPosition(currentPosition),
                        zoom: 18,
                      ),
                    ),
                  );
                }
                stopsMarkers.addAll({
                  MapMarker.getMapMarker(currentPosition),
                  MapMarker.getGreenMarker(tripData.liveLocation.last)
                });
                updateTripData(tripData);
                return GoogleMap(
                  padding: const EdgeInsets.all(50.0),
                  onMapCreated: (controller) {
                    googleMapController = controller;
                  },
                  initialCameraPosition:
                      GoogleMapsServices.getInitialCameraPosition(
                          currentPosition),
                  polylines: {
                    GoogleMapsServices.generatePolyLine(tripData),
                    routeLine,
                    // GoogleMapsServices.generateRoutePolyLine(encodedPolyline),
                  },
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  scrollGesturesEnabled: true,
                  mapType: MapType.normal,
                  markers: stopsMarkers,
                  gestureRecognizers: {
                    Factory<OneSequenceGestureRecognizer>(
                      () {
                        return EagerGestureRecognizer();
                      },
                    ),
                  },
                );
              },
              error: (error, stackTrace) {
                return AlertDialog(
                  title: const Text("Error"),
                  content: const Text("Some unexpected error has taken place"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.go("/");
                      },
                      child: const Text("Retry"),
                    ),
                  ],
                );
              },
              loading: () {
                return const SpinKitChasingDots(
                  color: Colors.black,
                  size: 20,
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RelocateFocusButton(
                currentLocation: currentPosition,
                controller: googleMapController,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> updateTripData(Trip tripData) async {
    await Future.delayed(Duration.zero);
    bool isTripActive = GoogleMapsServices.tripStatus(tripData);

    ref.read(tripStatusProvider.notifier).state = isTripActive;
  }

  plotRouteMarkersPolylines(TripRoute busRoute) {
    List<LatLng> coordinates = [];
    Set<Marker> markers = {};
    coordinates
        .add(LatLng(busRoute.origin.latitude, busRoute.origin.longitude));
    markers.add(MapMarker.getOriginStopMarker(busRoute));

    for (BusStop busStop in busRoute.stops) {
      LatLng coordinate = LatLng(busStop.latitude, busStop.longitude);
      coordinates.add(coordinate);
      markers.add(MapMarker.getStopMarker(busStop));
    }
    coordinates.add(
        LatLng(busRoute.destination.latitude, busRoute.destination.longitude));
    markers.add(MapMarker.getDestinationStopMarker(busRoute));
    routeLine = routeLine.copyWith(pointsParam: coordinates);

    stopsMarkers = markers;
  }
}
