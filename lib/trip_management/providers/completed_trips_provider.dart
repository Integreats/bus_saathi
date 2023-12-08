import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../helpers/trip_firestore_helper.dart';
import '../models/trip.dart';
import '../services/trip_json_parser.dart';

final completedTripsProvider = StreamProvider<List<Trip>>((ref) async* {
  final fetchedCompletedTrips = TripFirestoreHelper.getCompletedTripsStream();

  await for (final completedTrips in fetchedCompletedTrips) {
    final parsedAllActiveTrips = await compute(
      TripJsonParsers.parseTrips,
      completedTrips.docs,
    );
    yield parsedAllActiveTrips;
  }
  return;
});
