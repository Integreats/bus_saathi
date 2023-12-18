import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../bus_routes/widgets/bus_route_list_tile.dart';
import '../../bus_stops/models/bus_stop.dart';
import '../../bus_stops/providers/bus_stops_list_provider.dart';
import '../../widgets/textfields/custom_text_form_field.dart';
import '../controller/trip_planner_controller_provider.dart';
import '../controller/trip_planner_form_controller.dart';

class TripPlannerScreen extends ConsumerWidget {
  const TripPlannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Planner'),
      ),
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
                onSelected: ref
                    .read(tripPlannerFormControllerProvider.notifier)
                    .setOrigin,
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
                onSelected: ref
                    .read(tripPlannerFormControllerProvider.notifier)
                    .setDestination,
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
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    ref
                        .read(tripPlannerControllerProvider.notifier)
                        .findBusRoutes();
                  },
                  child: const Text('Find Route'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Found Routes',
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final foundBusRoutes = ref.watch(tripPlannerControllerProvider);
                return foundBusRoutes.when(
                  data: (busRoutes) {
                    if (busRoutes.isEmpty) {
                      return SliverFillRemaining(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Image.asset(
                                'images/illustrations/no_bus_route_found.png',
                                height: 200,
                              ),
                            ),
                            const Gap(8),
                            const Text("No bus routes found"),
                          ],
                        ),
                      );
                    }
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final currentBusRoute = busRoutes[index];
                          return BusRouteListTile(
                            onTap: () {
                              context
                                  .go('/trips/${currentBusRoute.routeNumber}');
                            },
                            busRoute: currentBusRoute,
                          );
                        },
                        childCount: busRoutes.length,
                      ),
                    );
                  },
                  error: (error, stackTrace) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(error.toString()),
                      ),
                    );
                  },
                  loading: () {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
