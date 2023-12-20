import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:unicons/unicons.dart';

import '../../l10n/locale.dart';
import '../../providers/location_stream_provider.dart';
import '../../providers/shake_detector_provider.dart';
import '../provider/trip_stream_provider.dart';
import '../views/trip_map_view.dart';
import '../widgets/trip_route_table.dart';

class TripScreen extends ConsumerWidget {
  const TripScreen({
    super.key,
    required this.tripId,
  });

  final String tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(shakeDetectorProvider);
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              title: Text($strings.trip),
              pinned: false,
              actions: [
                Consumer(
                  builder: (context, ref, child) {
                    const count = 10;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Gap(8),
                            const Icon(
                              UniconsLine.users_alt,
                              size: 16,
                            ),
                            const Gap(8),
                            Text(
                              '$count',
                              style: theme.textTheme.titleMedium,
                            ),
                            const Gap(8),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
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
                        label: Text($strings.shareDetails),
                      ),
                      const Gap(8),
                      ActionChip(
                        onPressed: () {
                          context.push('/busReview');
                        },
                        avatar: const Icon(UniconsLine.star),
                        label: Text(
                          $strings.reviewBus,
                        ),
                      ),
                      const Gap(8),
                      ActionChip(
                        onPressed: () {
                          // context.go('/busReview');
                        },
                        avatar: const Icon(Icons.volume_up_outlined),
                        label: Text(
                          $strings.announcements,
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
