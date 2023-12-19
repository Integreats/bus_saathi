import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../app_user/providers/app_user_controller_provider.dart';
import '../../widgets/list_tile/loader_list_tile.dart';
import '../../widgets/snackbars/show_successful_snackbar.dart';
import '../models/bus_stop_alert.dart';
import '../models/trip.dart';
import '../repositories/trip_repository.dart';

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
      child: DataTable(
        dataRowMinHeight: 56,
        dataRowMaxHeight: 72,
        columns: const <DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text(
                'Bus Stop',
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Arrival Time',
              ),
            ),
          ),
        ],
        rows: [
          DataRow(
            cells: [
              DataCell(
                Text(
                  tripRoute.origin.name,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              DataCell(
                Text(
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
              return DataRow(
                cells: [
                  DataCell(
                    Text(
                      currentBusStop.name,
                      style: theme.textTheme.titleMedium!.copyWith(
                        color: currentBusStop.id == trip.upcomingBusStop?.id
                            ? theme.colorScheme.primary
                            : null,
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        builder: (context) {
                          return Consumer(
                            builder: (context, ref, child) {
                              return SizedBox(
                                height: 200,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      currentBusStop.name,
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    LoaderListTile(
                                      title: const Text('Set an Alert'),
                                      onTap: () async {
                                        final appUser = ref
                                            .read(appUserControllerProvider)
                                            .value;
                                        await ref
                                            .read(tripRepositoryProvider)
                                            .createBusStopAlert(
                                              busStopAlert:
                                                  BusStopAlert.empty().copyWith(
                                                tripId: trip.id,
                                                routeNumber:
                                                    trip.tripRoute!.routeNumber,
                                                userId: appUser!.id,
                                                busStop: currentBusStop,
                                              ),
                                            )
                                            .then(
                                          (value) {
                                            context.pop();
                                            showSuccessSnackbar(
                                              context,
                                              title: 'Alert set successfully',
                                              message:
                                                  'You will be notified when the bus reaches ${currentBusStop.name}',
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                  DataCell(
                    Text(
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
          DataRow(
            cells: [
              DataCell(
                Text(
                  tripRoute.destination.name,
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: trip.upcomingBusStop == null
                        ? theme.colorScheme.primary
                        : null,
                  ),
                ),
              ),
              DataCell(
                !trip.isEnded
                    ? const Text(
                        '',
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        trip.upcomingBusStop != null
                            ? ''
                            : DateFormat('HH:mm').format(trip.endDateTime),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: trip.upcomingBusStop == null
                              ? theme.colorScheme.primary
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
