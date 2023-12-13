import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../views/trips_map_view.dart';

class TripsScreen extends ConsumerWidget {
  const TripsScreen({
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
                    child: TripsMapView(
                      routeNumber: routeNumber,
                    ),
                  ),
                ),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: Consumer(
            //     builder: (context, ref, child) {
            //       final runningTripsStream = ref.watch(
            //           runningTripsStreamProvider((
            //         routeNumber: routeNumber,
            //         routeDirection: RouteDirection.forward
            //       )));
            //       return runningTripsStream.when(
            //         skipError: true,
            //         data: (running) {
            //           return TripRouteTable(
            //             trip: data,
            //           );
            //         },
            //         loading: () {
            //           return const Center(
            //             child: CircularProgressIndicator(),
            //           );
            //         },
            //         error: (error, stack) {
            //           return Center(
            //             child: Text(
            //               error.toString(),
            //               style: theme.textTheme.titleLarge,
            //             ),
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),
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
