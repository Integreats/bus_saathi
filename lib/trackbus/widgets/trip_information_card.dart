import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../providers/trip_status_provider.dart';
import '../../locale/locale.dart';
import '../../providers/current_trip_provider.dart';
import '../../route_management/models/bus_details.dart';
import '../../trip_management/models/trip.dart';
import '../../user_management/conductor/models/conductor.dart';
import 'blinking_dot_animation.dart';

class TripInformationCard extends HookConsumerWidget {
  const TripInformationCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Trip trip = ref.read(currentTripProvider)!;
    Conductor conductor = trip.conductor;
    BusDetails busDetails = conductor.busDetails;
    String formattedDate =
        DateFormat("MMMM dd, yyyy").format(trip.startDateTime);
    String formattedStartTime = DateFormat("h:mm a").format(trip.startDateTime);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Builder(
                builder: (context) {
                  if (conductor.profilePicture == null ||
                      conductor.profilePicture == "") {
                    return CircleAvatar(
                      radius: 22,
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.15),
                      child: Text(
                        conductor.name.substring(0, 1),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.square(
                      dimension: 85,
                      child: Hero(
                        tag: conductor.profilePicture!,
                        child: CachedNetworkImage(
                          imageUrl: conductor.profilePicture!,
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            radius: 120,
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.15),
                            backgroundImage: imageProvider,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    conductor.name,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                        ),
                  ),
                  Text(
                    conductor.phoneNumber.toString(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  Text(busDetails.numberPlateNumber),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 2.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  $strings.startDate,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  formattedDate,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  $strings.startTime,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  formattedStartTime,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ],
        ),
        HookConsumer(
          builder: (context, ref, _) {
            bool isTripActive = ref.watch(tripStatusProvider);
            Widget child;
            if (isTripActive) {
              child = TripStatusWidget(
                color: Colors.green,
                message: $strings.tripIsActive,
              );
            } else {
              child = TripStatusWidget(
                color: Colors.red,
                message: $strings.tripHasEnded,
              );
            }
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: child,
            );
          },
        )
      ],
    );
  }
}

class TripStatusWidget extends StatelessWidget {
  const TripStatusWidget({
    super.key,
    required this.color,
    required this.message,
  });
  final Color color;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlinkingDot(
            color: color,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}
