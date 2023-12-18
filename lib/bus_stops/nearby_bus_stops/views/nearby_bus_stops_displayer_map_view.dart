import 'package:bus_saathi/providers/location_stream_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension_utilities/flutter_extension_utilities.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/nearby_bus_stops_marker_provider.dart';

class NearbyBusStopsMapView extends StatefulHookConsumerWidget {
  const NearbyBusStopsMapView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BusStopsDisplayerMapViewState();
}

class _BusStopsDisplayerMapViewState
    extends ConsumerState<NearbyBusStopsMapView> {
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

  LatLng lastCameraPosition = const LatLng(
    12.8882021,
    77.5949057,
  );

  @override
  void initState() {
    super.initState();
    final userLocation = ref.read(locationStreamProvider).value;
    _initialCameraPosition = CameraPosition(
      target: LatLng(
        userLocation?.latitude ?? 12.8882021,
        userLocation?.longitude ?? 77.5949057,
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
    ref.listen(locationStreamProvider, (previous, next) {
      if (next.value == null) return;
      googleMapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            next.value!.latitude,
            next.value!.longitude,
          ),
          zoom: 14.5,
        ),
      ));
    });
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 400,
        child: Stack(
          children: [
            Consumer(
              builder: (context, ref, child) {
                final busStopMarkers = ref.watch(busStopsMarkerProvider((
                  center: lastCameraPosition,
                  radius: boundedRegionCircle.radius,
                )));

                return GoogleMap(
                  circles: circles,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  initialCameraPosition: _initialCameraPosition,
                  markers: busStopMarkers,
                  onMapCreated: (controller) {
                    googleMapController = controller;
                    final userLocation =
                        ref.watch(locationStreamProvider).value;
                    if (userLocation != null) {
                      googleMapController
                          ?.animateCamera(CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: LatLng(
                            userLocation.latitude,
                            userLocation.longitude,
                          ),
                          zoom: 14.5,
                        ),
                      ));
                    }
                  },
                  onCameraMove: (position) {
                    circles.removeWhere((element) =>
                        element.circleId == const CircleId("bound"));
                    circles.add(boundedRegionCircle.copyWith(
                      centerParam: position.target,
                    ));

                    lastCameraPosition = position.target;
                  },
                  onCameraIdle: () {
                    setState(() {});
                  },
                  gestureRecognizers: {
                    Factory<OneSequenceGestureRecognizer>(
                      () {
                        return EagerGestureRecognizer();
                      },
                    ),
                  },
                );
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: NearbyBusStopsCard(
                lastCameraPosition: lastCameraPosition,
                boundedRegionCircle: boundedRegionCircle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NearbyBusStopsCard extends StatelessWidget {
  const NearbyBusStopsCard({
    super.key,
    required this.lastCameraPosition,
    required this.boundedRegionCircle,
  });

  final LatLng lastCameraPosition;
  final Circle boundedRegionCircle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.background,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "images/markers/bus_stop_blue.png",
                height: 16,
              ),
              const Gap(8),
              Consumer(
                builder: (context, ref, child) {
                  final busStopMarkers = ref.watch(busStopsMarkerProvider((
                    center: lastCameraPosition,
                    radius: boundedRegionCircle.radius,
                  )));
                  return Text(
                    "${busStopMarkers.length} Bus Stops",
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
