import 'package:bus_saathi/providers/firebase_providers/firestore_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../conductor/models/conductor.dart';
import '../../trip/models/trip.dart';
import '../services/trip_json_parser.dart';

final conductorCompletedTripsListProvider =
    StreamProvider.family<List<Trip>, Conductor>((ref, conductor) async* {
  final firestore = ref.watch(firestoreProvider);
  final fetchedTrips = firestore
      .collection('trips')
      .where('conductor.phoneNumber', isEqualTo: conductor.phoneNumber)
      .where('isEnded', isEqualTo: true)
      .snapshots();
  await for (final trip in fetchedTrips) {
    final parsedConductorTrip = await compute(
      TripJsonParsers.parseTrips,
      trip.docs,
    );
    yield parsedConductorTrip;
  }
});
