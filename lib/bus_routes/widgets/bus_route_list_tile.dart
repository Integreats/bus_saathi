import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/bus_route.dart';

class BusRouteListTile extends HookConsumerWidget {
  const BusRouteListTile({
    Key? key,
    required this.busRoute,
    required this.onTap,
  }) : super(key: key);

  final BusRoute busRoute;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final origin = busRoute.origin;
    final destination = busRoute.destination;
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
                backgroundColor: theme.colorScheme.primary.withOpacity(0.15),
                child: Text(
                  origin.name.substring(0, 1),
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              title: Text(
                busRoute.routeNumber,
                style: theme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    origin.name,
                    style: TextStyle(
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                    ),
                  ),
                  Text(
                    destination.name,
                    style: TextStyle(
                      color: theme.colorScheme.onBackground,
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
