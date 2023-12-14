import 'package:bus_saathi/providers/location_stream_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';

import '../../bus_routes/providers/nearby_bus_routes_provider.dart';
import '../../bus_routes/widgets/bus_route_list_tile.dart';
import '../../bus_stops/nearby_bus_stops/views/nearby_bus_stops_displayer_map_view.dart';
import '../../l10n/locale.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
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
        actions: [
          IconButton(
            onPressed: () {
              context.push('/search');
            },
            icon: const Icon(UniconsLine.search),
          ),
        ],
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
                  const NearbyBusStopsMapView(),
                  const SizedBox(
                    height: 24,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Nearby Routes",
                style: theme.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final location = ref.watch(locationStreamProvider).value;
              final nearbyBusRoutes = ref.watch(nearbyBusRoutesProvider((
                latitude: location?.latitude ?? 12.9378567,
                longitude: location?.longitude ?? 77.5990891,
              )));
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final busRoute = nearbyBusRoutes[index];
                    return BusRouteListTile(
                      busRoute: busRoute,
                      onTap: () {
                        context.go('/trips/${busRoute.routeNumber}');
                      },
                    );
                  },
                  childCount: nearbyBusRoutes.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
