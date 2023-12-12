import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../extenstions.dart';
import '../../trip/models/live_location.dart';

class RelocateFocusButton extends StatelessWidget {
  const RelocateFocusButton({
    Key? key,
    required this.controller,
    required this.currentLocation,
  }) : super(key: key);

  final GoogleMapController? controller;
  final LiveLocation currentLocation;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () async {
        await controller?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLngExtension.fromPosition(currentLocation),
              zoom: 18.00,
            ),
          ),
        );
      },
      child: const Icon(Icons.center_focus_weak_rounded),
    );
  }
}
