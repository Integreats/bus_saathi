import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../helpers/trip_firestore_helper.dart';
import '../models/trip.dart';
import '../services/trip_json_parser.dart';

final allActiveTripsProvider = StreamProvider<List<Trip>>((ref) async* {
  final fetchedActiveTrips = TripFirestoreHelper.getActiveTripsStream();

  await for (final activeTrips in fetchedActiveTrips) {
    final parsedAllActiveTrips = await compute(
      TripJsonParsers.parseTrips,
      activeTrips.docs,
    );
    yield parsedAllActiveTrips;
  }
  return;
});
