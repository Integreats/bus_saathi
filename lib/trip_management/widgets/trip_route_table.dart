import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../trip/models/trip.dart';

class TripRouteTable extends StatelessWidget {
  const TripRouteTable({
    super.key,
    required this.trip,
  });

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tripRoute = trip.tripRoute;
    if (tripRoute == null) {
      return const SizedBox();
    }
    final busStops = tripRoute.stops;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const {
          1: FractionColumnWidth(0.4),
          2: FractionColumnWidth(0.2),
        },
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(4),
            ),
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Text(
                  "Bus Stop",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Text(
                  "Arrival Time",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16.0,
                  right: 16.0,
                  bottom: 8,
                ),
                child: Text(
                  tripRoute.origin.name,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16.0,
                  right: 16.0,
                  bottom: 8,
                ),
                child: Text(
                  DateFormat('HH:mm').format(trip.startDateTime),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          ...List.generate(
            busStops.length,
            (index) {
              final currentBusStop = busStops[index];
              return TableRow(
                decoration: BoxDecoration(
                  color: currentBusStop.id == trip.upcomingBusStop?.id
                      ? theme.colorScheme.primary
                      : null,
                  borderRadius: BorderRadius.circular(12),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      currentBusStop.name,
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: currentBusStop.id == trip.upcomingBusStop?.id
                            ? theme.colorScheme.onPrimary
                            : null,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      trip.busStopsCrossed == null
                          ? ''
                          : trip.busStopsCrossed!.containsKey(currentBusStop.id)
                              ? DateFormat('HH:mm').format(trip
                                  .busStopsCrossed![currentBusStop.id]!
                                  .crossedDateTime)
                              : "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: currentBusStop.id == trip.upcomingBusStop?.id
                            ? theme.colorScheme.primary
                            : null,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          TableRow(
            decoration: BoxDecoration(
              color: trip.upcomingBusStop == null
                  ? theme.colorScheme.primary
                  : null,
              borderRadius: BorderRadius.circular(12),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 16.0,
                  right: 16.0,
                  bottom: 16,
                ),
                child: Text(
                  tripRoute.destination.name,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: trip.upcomingBusStop == null
                        ? theme.colorScheme.onPrimary
                        : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 16.0,
                  right: 16.0,
                  bottom: 16,
                ),
                child: !trip.isEnded
                    ? const Text(
                        '',
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        DateFormat('HH:mm').format(trip.endDateTime),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: trip.upcomingBusStop == null
                              ? theme.colorScheme.onPrimary
                              : null,
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
