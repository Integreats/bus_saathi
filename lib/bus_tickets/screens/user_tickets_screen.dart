import 'package:bus_saathi/bus_tickets/providers/bus_tickets_provider.dart';
import 'package:bus_saathi/widgets/tile_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserTicketsScreen extends ConsumerWidget {
  const UserTicketsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        Consumer(
          builder: (context, ref, child) {
            final myTickets = ref.watch(userBusTicketsListProvider);
            return myTickets.when(
              data: (busTickets) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final currentBusTicket = busTickets[index];
                      return TileLayout(
                        listTile: ListTile(
                          leading: const CircleAvatar(),
                          title: Text(
                            '${currentBusTicket.origin.name.trim()} -> ${currentBusTicket.destination.name}',
                          ),
                          subtitle: Text(
                            DateFormat.yMMMd()
                                .format(currentBusTicket.createdAt),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                elevation: 5,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                builder: (context) {
                                  return SizedBox(
                                    height: 300,
                                    child: Column(
                                      children: [
                                        const Gap(16),
                                        Text(
                                          "My Ticket",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                        const Gap(16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              currentBusTicket.origin.name,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                              child: Icon(
                                                Icons.arrow_forward_rounded,
                                                size: 16,
                                              ),
                                            ),
                                            Text(
                                              currentBusTicket.destination.name,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground,
                                              ),
                                            ),
                                          ],
                                        ),
                                        QrImageView(
                                          data: currentBusTicket.id,
                                          version: QrVersions.auto,
                                          size: 200.0,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Text('View'),
                          ),
                        ),
                      );
                    },
                    childCount: busTickets.length,
                  ),
                );
              },
              loading: () {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
              error: (error, stackTrace) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text(error.toString()),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
