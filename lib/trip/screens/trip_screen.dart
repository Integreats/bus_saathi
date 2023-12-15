import 'package:bus_saathi/providers/location_stream_provider.dart';
import 'package:bus_saathi/trip/widgets/trip_route_table.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:unicons/unicons.dart';

import '../provider/trip_stream_provider.dart';
import '../views/trip_map_view.dart';

class TripScreen extends ConsumerWidget {
  const TripScreen({
    super.key,
    required this.tripId,
  });

  final String tripId;

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
                    child: TripMapView(
                      tripId: tripId,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ActionChip(
                        shape: const StadiumBorder(),
                        avatar: const Icon(
                          UniconsLine.share_alt,
                        ),
                        onPressed: () async {
                          final trip = ref
                              .watch(tripStreamProvider(
                                tripId,
                              ))
                              .value;
                          if (trip == null) return;
                          final userLocation =
                              ref.watch(locationStreamProvider).value;

                          if (userLocation == null) return;

                          await Share.share(
                            'Hi, I am travelling in bus ${trip.bus.licensePlateNumber} on route ${trip.bus.routeNumber} which is from ${trip.tripRoute!.origin.name} to ${trip.tripRoute!.destination.name} on ${DateFormat.yMMMMd().format(trip.startDateTime)} at ${DateFormat.jm().format(trip.startDateTime)}.\nMy current location is \nhttp://www.google.com/maps/place/${userLocation.latitude},${userLocation.longitude} \nConductor details are:\nName: ${trip.conductor.name}\nPhone Number: ${trip.conductor.phoneNumber}',
                          );
                        },
                        label: const Text("Share Details"),
                      ),
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
              ),
            ),
            SliverToBoxAdapter(
              child: Consumer(
                builder: (context, ref, child) {
                  final trip = ref.watch(tripStreamProvider(
                    tripId,
                  ));
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
