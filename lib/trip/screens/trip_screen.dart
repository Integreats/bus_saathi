import 'package:bus_saathi/trip_management/widgets/trip_route_table.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';

import '../provider/trip_stream_provider.dart';
import '../views/trip_map_view.dart';

class TripScreen extends ConsumerWidget {
  const TripScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar.medium(
              title: Text('Trip'),
              pinned: false,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: const TripMapView(
                      tripId: "06d8782e-c487-4a21-bd78-4490a8dcc935",
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
            ),
            SliverToBoxAdapter(
              child: Consumer(
                builder: (context, ref, child) {
                  final trip = ref.watch(tripStreamProvider(
                      "06d8782e-c487-4a21-bd78-4490a8dcc935"));
                  return trip.when(
                    skipError: true,
                    data: (data) {
                      return TripRouteTable(
                        trip: data,
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
