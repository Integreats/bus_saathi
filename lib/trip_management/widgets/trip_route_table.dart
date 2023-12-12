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
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {
        0: FractionColumnWidth(0.2),
        1: FractionColumnWidth(0.4),
        2: FractionColumnWidth(0.2),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Serial No.",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Bus Stop",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "1",
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(tripRoute.origin.name),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                DateFormat('MMM dd, yy HH:mm:ss').format(trip.startDateTime),
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
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    (index + 2).toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    currentBusStop.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    trip.busStopsCrossed == null
                        ? '--'
                        : trip.busStopsCrossed!.containsKey(currentBusStop.id)
                            ? DateFormat('MMM dd, yy HH:mm:ss').format(trip
                                .busStopsCrossed![currentBusStop.id]!
                                .crossedDateTime)
                            : "--",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          },
        ),
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                (busStops.length + 2).toString(),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(tripRoute.destination.name),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: !trip.isEnded
                  ? const Text(
                      '--',
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      DateFormat('MMM dd, yy HH:mm:ss')
                          .format(trip.endDateTime),
                      textAlign: TextAlign.center,
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
