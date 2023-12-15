import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../bus_routes/models/route_direction.dart';
import '../../bus_routes/providers/bus_route_by_route_number_provider.dart';
import '../../extenstions.dart';
import '../provider/running_trips_stream_provider.dart';
import '../services/bus_route_map_marker_service.dart';
import '../services/trip_map_marker_service.dart';

class RunningTripsMapView extends StatefulHookConsumerWidget {
  const RunningTripsMapView({
    super.key,
    required this.routeNumber,
  });

  final String routeNumber;

  @override
  ConsumerState<RunningTripsMapView> createState() => _TripMapViewState();
}

class _TripMapViewState extends ConsumerState<RunningTripsMapView> {
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
    final busRoute =
        ref.watch(busRouteByRouteNumberProvider(widget.routeNumber));
    if (busRoute == null) return const Text("Route not found");
    return runningTripsStream.when(
      skipError: true,
      skipLoadingOnRefresh: true,
      skipLoadingOnReload: true,
      data: (trips) {
        Set<Marker> busMarkers = {};
        if (trips.isNotEmpty) {
          final tripMapMarkerService = TripMapMarkerService(trip: trips.first);
          plotsNotifier.value =
              tripMapMarkerService.plotRouteMarkersPolylines();
          busMarkers = trips.map((e) {
            final busMarkerService = TripMapMarkerService(trip: e);

            return busMarkerService.busMarker;
          }).toSet();
        } else {
          final busMapMarkerService =
              BusRouteMapMarkerService(busRoute: busRoute);
          plotsNotifier.value = busMapMarkerService.plotRouteMarkersPolylines();
        }
        return ValueListenableBuilder(
          valueListenable: plotsNotifier,
          builder: (context, value, _) {
            return GoogleMap(
              onCameraMove: (position) {
                currentMapZoom = position.zoom;
              },
              onMapCreated: (controller) {
                googleMapController = controller;
                if (trips.isNotEmpty) {
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
                }
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
