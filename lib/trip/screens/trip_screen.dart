import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:unicons/unicons.dart';

class TripScreen extends ConsumerWidget {
  const TripScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.medium(
            title: Text('Trip'),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: GoogleMap(
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    trafficEnabled: true,
                    zoomControlsEnabled: false,
                    minMaxZoomPreference: const MinMaxZoomPreference(10, 20),
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(12.8942931, 77.598126),
                      zoom: 15,
                    ),
                    gestureRecognizers: {
                      Factory<OneSequenceGestureRecognizer>(
                        () {
                          return EagerGestureRecognizer();
                        },
                      ),
                    },
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                TextButton.icon(
                  onPressed: () {
                    context.go('/busReview');
                  },
                  icon: const Icon(UniconsLine.star),
                  label: const Text(
                    'Review Bus',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    // context.go('/busReview');
                  },
                  icon: const Icon(UniconsLine.star),
                  label: const Text(
                    'Announcements',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_alert_outlined,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
