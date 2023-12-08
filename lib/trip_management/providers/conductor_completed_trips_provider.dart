import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../user_management/conductor/models/conductor.dart';
import '../helpers/trip_firestore_helper.dart';
import '../models/trip.dart';
import '../services/trip_json_parser.dart';

final conductorCompletedTripsListProvider =
    StreamProvider.family<List<Trip>, Conductor>((ref, conductor) async* {
  final fetchedTrips = TripFirestoreHelper.getConductorCompletedTripsStream(
      conductor.phoneNumber);
  await for (final trip in fetchedTrips) {
    final parsedConductorTrip = await compute(
      TripJsonParsers.parseTrips,
      trip.docs,
    );
    yield parsedConductorTrip;
  }
});
