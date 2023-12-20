import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/bus_ticket.dart';

class BusTicketScreen extends HookConsumerWidget {
  const BusTicketScreen({
    super.key,
    required this.busTicket,
  });

  final BusTicket busTicket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            automaticallyImplyLeading: true,
            leadingWidth: 15,
            centerTitle: true,
            titleSpacing: 15,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        busTicket.origin.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onBackground,
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
                        busTicket.destination.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
