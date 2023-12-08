import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../trip_management/models/trip.dart';
import 'current_trip_provider.dart';

final tripStatusProvider = StateProvider<bool>((ref) {
  Trip? currentTrip = ref.watch(currentTripProvider);
  if (currentTrip != null) {
    return true;
  }
  return false;
});
