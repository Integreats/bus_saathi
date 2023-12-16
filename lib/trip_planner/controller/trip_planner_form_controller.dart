import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bus_stops/models/bus_stop.dart';
import '../models/trip_planner_form.dart';

final tripPlannerFormControllerProvider =
    NotifierProvider<TripPlannerFormNotifier, TripPlannerForm>(
        TripPlannerFormNotifier.new);

class TripPlannerFormNotifier extends Notifier<TripPlannerForm> {
  @override
  build() {
    return TripPlannerForm(
      origin: BusStop.empty(),
      destination: BusStop.empty(),
    );
  }

  void setOrigin(BusStop origin) {
    state = state.copyWith(origin: origin);
  }

  void setDestination(BusStop destination) {
    state = state.copyWith(destination: destination);
  }
}
