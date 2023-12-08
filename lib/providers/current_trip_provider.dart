import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../trip_management/models/trip.dart';


final currentTripProvider = StateProvider<Trip?>((ref) {
  return;
});
