import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extenstions.dart';
import '../provider/trip_stream_provider.dart';
import '../services/trip_map_marker_service.dart';

class TripMapView extends StatefulHookConsumerWidget {
  const TripMapView({
    super.key,
    required this.tripId,
  });

  final String tripId;

  @override
  ConsumerState<TripMapView> createState() => _TripMapViewState();
}

class _TripMapViewState extends ConsumerState<TripMapView> {
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
    final tripStream = ref.watch(tripStreamProvider(widget.tripId));

    return tripStream.when(
      skipError: true,
      skipLoadingOnRefresh: true,
      skipLoadingOnReload: true,
      data: (data) {
        final tripMapMarkerService = TripMapMarkerService(trip: data);
        plotsNotifier.value = tripMapMarkerService.plotRouteMarkersPolylines();
        final busMarker = tripMapMarkerService.busMarker;
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
                        data.liveLocation.first,
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
                if (busMarker != null) busMarker,
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
