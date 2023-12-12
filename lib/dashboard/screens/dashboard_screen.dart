
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../bus_stops/nearby_bus_stops/views/nearby_bus_stops_displayer_map_view.dart';
import '../../l10n/locale.dart';
import '../../widgets/buttons/elevated_loader_button.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              $strings.dashboard,
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(
                    height: 24,
                  ),
                  const NearbyBusStopsMapView()
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedLoaderButton(
                onPressed: () {
                  context.go('/trip/_');
                },
                label: const Text('Check In'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
