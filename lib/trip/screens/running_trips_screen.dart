import 'package:bus_saathi/widgets/tile_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';

import '../../bus_routes/models/route_direction.dart';
import '../../bus_routes/providers/bus_route_by_route_number_provider.dart';
import '../provider/running_trips_stream_provider.dart';
import '../views/running_trips_map_view.dart';
import '../widgets/bus_route_table.dart';

class RunningTripsScreen extends ConsumerWidget {
  const RunningTripsScreen({
    super.key,
    required this.routeNumber,
  });
  final String routeNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              title: Text('Live Trips on $routeNumber'),
              pinned: false,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: RunningTripsMapView(
                      routeNumber: routeNumber,
                    ),
                  ),
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final runningTripsStream = ref.watch(
                    runningTripsStreamProvider((
                  routeNumber: routeNumber,
                  routeDirection: RouteDirection.forward
                )));
                return runningTripsStream.when(
                  skipError: true,
                  data: (runningTrips) {
                    if (runningTrips.isEmpty) {
                      return const SliverToBoxAdapter(child: SizedBox());
                    }
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final runningTrip = runningTrips[index];
                          return TileLayout(
                            listTile: ListTile(
                              title: Text(
                                runningTrip.bus.licensePlateNumber,
                                style: theme.textTheme.titleLarge,
                              ),
                              subtitle: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      UniconsLine.users_alt,
                                      size: 16,
                                    ),
                                    const Gap(8),
                                    Text(
                                      runningTrip.crowd?.personCount
                                              .toString() ??
                                          '0',
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    const Gap(8),
                                    const CircleAvatar(
                                      radius: 4,
                                      backgroundColor: Colors.green,
                                    ),
                                    const Gap(8),
                                    Text(
                                      (runningTrip.crowd?.personCount ?? 0) >
                                              runningTrip.bus.capacity
                                          ? 'Highly Crowded'
                                          : 'Underly Crowded',
                                      style: theme.textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  context.go('/trip/${runningTrips.first.id}');
                                },
                                child: const Text("Check In"),
                              ),
                            ),
                          );
                        },
                        childCount: runningTrips.length,
                      ),
                    );
                  },
                  loading: () {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  error: (error, stack) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          error.toString(),
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            SliverToBoxAdapter(
              child: Consumer(
                builder: (context, ref, child) {
                  final busRoute =
                      ref.watch(busRouteByRouteNumberProvider(routeNumber));
                  if (busRoute == null) return const SizedBox();
                  return BusRouteTable(
                    busRoute: busRoute,
                  );
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 64,
              ),
            )
          ],
        ),
      ),
    );
  }
}
