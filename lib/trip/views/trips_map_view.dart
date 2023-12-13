import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../bus_routes/models/route_direction.dart';
import '../../extenstions.dart';
import '../provider/running_trips_stream_provider.dart';
import '../services/trip_map_marker_service.dart';

class TripsMapView extends StatefulHookConsumerWidget {
  const TripsMapView({
    super.key,
    required this.routeNumber,
  });

  final String routeNumber;

  @override
  ConsumerState<TripsMapView> createState() => _TripMapViewState();
}

class _TripMapViewState extends ConsumerState<TripsMapView> {
  GoogleMapController? googleMapController;
  late final ValueNotifier<
          ({Set<Marker>? busStopsMarkers, Polyline? tripRoutePolyline})>
      plotsNotifier;
  double currentMapZoom = 14;
  @override
  void initState() {
    super.initState();
    plotsNotifier = ValueNotifier((
      busStopsMarkers: null,
      tripRoutePolyline: null,
    ));
  }

  @override
  void dispose() {
    plotsNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final runningTripsStream = ref.watch(runningTripsStreamProvider((
      routeNumber: widget.routeNumber,
      routeDirection: RouteDirection.forward
    )));

    return runningTripsStream.when(
      skipError: true,
      skipLoadingOnRefresh: true,
      skipLoadingOnReload: true,
      data: (trips) {
        if (trips.isEmpty) return const Text("No Running Trips");
        final tripMapMarkerService = TripMapMarkerService(trip: trips.first);
        plotsNotifier.value = tripMapMarkerService.plotRouteMarkersPolylines();
        final busMarkers = trips.map((e) {
          final tripMarkerService = TripMapMarkerService(trip: e);
          return tripMarkerService.busMarker;
        }).toSet();
        return ValueListenableBuilder(
          valueListenable: plotsNotifier,
          builder: (context, value, _) {
            return GoogleMap(
              onCameraMove: (position) {
                currentMapZoom = position.zoom;
              },
              onMapCreated: (controller) {
                googleMapController = controller;
                googleMapController?.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLngExtension.fromPosition(
                        trips.first.liveLocation.first,
                      ),
                      zoom: currentMapZoom,
                    ),
                  ),
                );
              },
              polylines: {
                if (value.tripRoutePolyline != null) value.tripRoutePolyline!,
              },
              markers: {
                ...busMarkers,
                if (value.busStopsMarkers != null) ...value.busStopsMarkers!,
              },
              mapType: MapType.normal,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              trafficEnabled: true,
              zoomControlsEnabled: false,
              minMaxZoomPreference: const MinMaxZoomPreference(10, 20),
              initialCameraPosition: CameraPosition(
                target: const LatLng(12.8942931, 77.598126),
                zoom: currentMapZoom,
              ),
              gestureRecognizers: {
                Factory<OneSequenceGestureRecognizer>(
                  () {
                    return EagerGestureRecognizer();
                  },
                ),
              },
            );
          },
        );
      },
      loading: () {
        return const SizedBox();
      },
      error: (error, stack) {
        return const SizedBox();
      },
    );
  }
}
