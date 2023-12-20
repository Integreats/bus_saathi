import 'package:flutter/material.dart';
import 'package:flutter_extension_utilities/flutter_extension_utilities.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../bus_stops/models/bus_stop.dart';
import '../../bus_stops/providers/bus_stops_list_provider.dart';
import '../../providers/firebase_providers/firebase_analytics_provider.dart';
import '../../widgets/textfields/custom_text_form_field.dart';
import '../providers/bus_ticket_booking_controller_provider.dart';
import '../providers/bus_ticket_payments_controller_provider.dart';

class TicketBookingScreen extends StatefulHookConsumerWidget {
  const TicketBookingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TicketBookingScreenState();
}

class _TicketBookingScreenState extends ConsumerState<TicketBookingScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Autocomplete<BusStop>(
                key: const ValueKey('Origin'),
                optionsBuilder: (textEditingValue) {
                  final busStops = ref.watch(busStopsListProvider).value ?? [];

                  if (textEditingValue.text == '') {
                    return const Iterable<BusStop>.empty();
                  }
                  return busStops.where((element) => element.name
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase()));
                },
                displayStringForOption: (option) => option.name,
                onSelected: (value) async {
                  ref
                      .read(busTicketBookingControllerProvider.notifier)
                      .setOrigin(value);

                  await ref.read(firebaseAnalyticsProvider).logSearch(
                        searchTerm: value.name,
                        origin: value.name,
                      );
                },
                fieldViewBuilder: (context, textEditingController, focusNode,
                    onFieldSubmitted) {
                  return CustomTextFormField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    onEditingComplete: onFieldSubmitted,
                    hintText: 'Enter your source bus stop',
                    prefixIcon: const Icon(
                      FeatherIcons.mapPin,
                      color: Colors.green,
                    ),
                    // validator: (value) {
                    //   final busRoute = ref.read(busRoutesFormControllerProvider);
                    //   List<BusStop> stops =
                    //       ref.watch(busStopsListProvider).value ?? [];
                    //   if (!stops.contains(busRoute.origin)) {
                    //     return 'Select a valid origin';
                    //   }
                    //   return null;
                    // },
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Autocomplete<BusStop>(
                key: const ValueKey('Destination'),
                optionsBuilder: (textEditingValue) {
                  final busStops = ref.watch(busStopsListProvider).value ?? [];

                  if (textEditingValue.text == '') {
                    return const Iterable<BusStop>.empty();
                  }
                  return busStops.where((element) => element.name
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase()));
                },
                onSelected: (value) async {
                  ref
                      .read(busTicketBookingControllerProvider.notifier)
                      .setDestination(value);
                  await ref.read(firebaseAnalyticsProvider).logSearch(
                        searchTerm: value.name,
                        destination: value.name,
                      );
                },
                displayStringForOption: (option) => option.name,
                fieldViewBuilder: (context, textEditingController, focusNode,
                    onFieldSubmitted) {
                  return CustomTextFormField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    onEditingComplete: onFieldSubmitted,
                    hintText: 'Enter your destination bus stop',
                    prefixIcon: const Icon(
                      FeatherIcons.mapPin,
                      color: Colors.red,
                    ),
                    // validator: (value) {
                    //   final busRoute = ref.read(busRoutesFormControllerProvider);
                    //   List<BusStop> stops =
                    //       ref.watch(busStopsListProvider).value ?? [];
                    //   if (!stops.contains(busRoute.origin)) {
                    //     return 'Select a valid origin';
                    //   }
                    //   return null;
                    // },
                  );
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: Gap(64),
            ),
            SliverToBoxAdapter(
              child: Consumer(
                builder: (context, ref, _) {
                  final busTicketForm =
                      ref.watch(busTicketBookingControllerProvider).value;
                  if (busTicketForm == null) {
                    return const SizedBox.shrink();
                  }
                  return Column(
                    children: [
                      Text(
                        'Ticket Amount\n${busTicketForm.ticketAmount.toFixed(2)}',
                        style: theme.textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const Gap(108.0),
                      ElevatedButton(
                        onPressed: () {
                          ref
                              .read(
                                  busTicketsPaymentControllerProvider.notifier)
                              .checkout(busTicketForm);
                        },
                        child: const Text('Book Ticket'),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
