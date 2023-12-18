import 'package:flutter/material.dart';

import '../models/bus_stop.dart';

class BusStopListTile extends StatelessWidget {
  const BusStopListTile({
    Key? key,
    required this.busStop,
    required this.onTap,
  }) : super(key: key);

  final BusStop busStop;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            child: ListTile(
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 22,
                backgroundColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.15),
                child: Text(
                  busStop.name.substring(0, 1),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              title: Text(
                busStop.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Row(
                children: [
                  Text(
                    'Lat: ${busStop.latitude.toStringAsFixed(6)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.15),
                    ),
                  ),
                  Text(
                    "Lon: ${busStop.longitude.toStringAsFixed(6)}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 0.05,
          ),
        ],
      ),
    );
  }
}
