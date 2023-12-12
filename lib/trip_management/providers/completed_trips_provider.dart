import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/firebase_providers/firestore_provider.dart';
import '../../trip/models/trip.dart';
import '../services/trip_json_parser.dart';

final completedTripsProvider = StreamProvider<List<Trip>>((ref) async* {
  final firestore = ref.watch(firestoreProvider);
  final fetchedCompletedTrips = firestore
      .collection('trips')
      .where('isEnded', isEqualTo: true)
      .snapshots();

  await for (final completedTrips in fetchedCompletedTrips) {
    final parsedAllActiveTrips = await compute(
      TripJsonParsers.parseTrips,
      completedTrips.docs,
    );
    yield parsedAllActiveTrips;
  }
  return;
});
