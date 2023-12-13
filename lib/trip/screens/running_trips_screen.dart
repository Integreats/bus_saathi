import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../bus_routes/models/route_direction.dart';
import '../provider/running_trips_stream_provider.dart';
import '../views/running_trips_map_view.dart';

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
            SliverFillRemaining(
              child: Consumer(
                builder: (context, ref, child) {
                  final runningTripsStream = ref.watch(
                      runningTripsStreamProvider((
                    routeNumber: routeNumber,
                    routeDirection: RouteDirection.forward
                  )));
                  return runningTripsStream.when(
                    skipError: true,
                    data: (runningTrips) {
                      if (runningTrips.isEmpty) return const SizedBox();
                      return ListView.builder(
                        itemCount: runningTrips.length,
                        itemBuilder: (context, index) {
                          final runningTrip = runningTrips[index];
                          return ListTile(
                            title: Text(
                              runningTrip.bus.licensePlateNumber,
                              style: theme.textTheme.titleLarge,
                            ),
                            trailing: ElevatedButton(
                              onPressed: () {
                                context.go('/trip/${runningTrips.first.id}');
                              },
                              child: const Text("Check In"),
                            ),
                          );
                        },
                      );
                    },
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    error: (error, stack) {
                      return Center(
                        child: Text(
                          error.toString(),
                          style: theme.textTheme.titleLarge,
                        ),
                      );
                    },
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
