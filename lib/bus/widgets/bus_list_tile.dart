import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/bus.dart';
import '../models/bus_menu_options.dart';

class BusListTile extends HookConsumerWidget {
  const BusListTile({
    Key? key,
    required this.bus,
    required this.onTap,
    this.onMenuOptionSelected,
  }) : super(key: key);

  final Bus bus;
  final VoidCallback? onTap;
  final ValueChanged<BusMenuOptions>? onMenuOptionSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  bus.model[0],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              title: Wrap(
                children: [
                  Text(
                    bus.model,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  Text(
                    bus.routeNumber,
                  ),
                  const Gap(4),
                  const CircleAvatar(
                    radius: 4,
                  ),
                  const Gap(4),
                  Text(bus.licensePlateNumber),
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
