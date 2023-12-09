import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BusStopsDisplayerMapView extends StatefulHookConsumerWidget {
  const BusStopsDisplayerMapView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BusStopsDisplayerMapViewState();
}

class _BusStopsDisplayerMapViewState
    extends ConsumerState<BusStopsDisplayerMapView> {
  late final CameraPosition _initialCameraPosition;
  late GoogleMapController? googleMapController;

  final boundedRegionCircle = Circle(
    circleId: const CircleId("bound"),
    strokeWidth: 1,
    strokeColor: Colors.blue,
    fillColor: Colors.blue.withOpacity(0.1),
    center: const LatLng(
      12.8882021,
      77.5949057,
    ),
    radius: 1000,
  );

  late Set<Circle> circles;

  @override
  void initState() {
    super.initState();

    _initialCameraPosition = const CameraPosition(
      target: LatLng(
        12.8882021,
        77.5949057,
      ),
      zoom: 14.5,
    );

    circles = {boundedRegionCircle};
  }

  @override
  void dispose() {
    googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 400,
        child: GoogleMap(
          circles: circles,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (controller) {
            googleMapController = controller;
          },
          onCameraMove: (position) {
            circles = circles.union({
              boundedRegionCircle.copyWith(
                centerParam: position.target,
              )
            });

            setState(() {});
          },
          onCameraIdle: () {
            print("Camera Idle");
          },
          gestureRecognizers: {
            Factory<OneSequenceGestureRecognizer>(
              () {
                return EagerGestureRecognizer();
              },
            ),
          },
        ),
      ),
    );
  }
}
