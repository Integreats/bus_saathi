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
  @override
  Widget build(BuildContext context) {
    return const GoogleMap(
      initialCameraPosition: null,
    );
  }
}
