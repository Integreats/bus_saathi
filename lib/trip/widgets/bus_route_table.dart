import 'package:bus_saathi/l10n/locale.dart';
import 'package:flutter/material.dart';

import '../../bus_routes/models/bus_route.dart';

class BusRouteTable extends StatelessWidget {
  const BusRouteTable({
    super.key,
    required this.busRoute,
  });

  final BusRoute busRoute;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final busStops = busRoute.stops;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const {
          1: FractionColumnWidth(0.9),
          2: FractionColumnWidth(0.8),
        },
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(4),
            ),
            children:  [
              SizedBox(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Text(
                  $strings.busStop,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              Image.asset(
                'images/markers/bus_stop_green.png',
                height: 24,
                width: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16.0,
                  right: 16.0,
                  bottom: 8,
                ),
                child: Text(
                  busRoute.origin.name,
                  style: theme.textTheme.titleLarge,
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
                  borderRadius: BorderRadius.circular(12),
                ),
                children: [
                  Image.asset(
                    'images/markers/bus_stop_blue.png',
                    height: 24,
                    width: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      currentBusStop.name,
                      style: theme.textTheme.titleLarge!,
                    ),
                  ),
                ],
              );
            },
          ),
          TableRow(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            children: [
              Image.asset(
                'images/markers/bus_stop_red.png',
                height: 24,
                width: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 16.0,
                  right: 16.0,
                  bottom: 16,
                ),
                child: Text(
                  busRoute.destination.name,
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
