import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bus_routes/models/bus_route.dart';
import '../../bus_routes/providers/bus_routes_list_provider.dart';
import '../models/trip_planner_form.dart';
import 'trip_planner_form_controller.dart';

final tripPlannerControllerProvider =
    AsyncNotifierProvider<TripPlannerNotifier, List<BusRoute>>(
        TripPlannerNotifier.new);

class TripPlannerNotifier extends AsyncNotifier<List<BusRoute>> {
  TripPlannerForm get _tripPlannerForm =>
      ref.watch(tripPlannerFormControllerProvider);

  @override
  Future<List<BusRoute>> build() async {
    return [];
  }

  Future<void> findBusRoutes() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final busRoutes = ref.watch(busRoutesListProvider).value ??
          (await ref.watch(busRoutesListProvider.future))!;

      final List<BusRoute> foundBusRoutes = [];
      for (final busRoute in busRoutes) {
        if ((busRoute.stops.contains(_tripPlannerForm.origin) ||
                busRoute.origin == _tripPlannerForm.origin ||
                busRoute.destination == _tripPlannerForm.origin) &&
            (busRoute.stops.contains(_tripPlannerForm.destination) ||
                busRoute.origin == _tripPlannerForm.destination ||
                busRoute.destination == _tripPlannerForm.destination)) {
          foundBusRoutes.add(busRoute);
        }
      }
      return foundBusRoutes;
    });
  }
}
