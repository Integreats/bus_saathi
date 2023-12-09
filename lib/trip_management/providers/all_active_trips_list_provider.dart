import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/firebase_providers/firestore_provider.dart';
import '../models/trip.dart';
import '../services/trip_json_parser.dart';

final allActiveTripsProvider = StreamProvider<List<Trip>>((ref) async* {
  final firestore = ref.watch(firestoreProvider);
  final fetchedActiveTrips = firestore
      .collection('trips')
      .where('isEnded', isEqualTo: false)
      .snapshots();

  await for (final activeTrips in fetchedActiveTrips) {
    final parsedAllActiveTrips = await compute(
      TripJsonParsers.parseTrips,
      activeTrips.docs,
    );
    yield parsedAllActiveTrips;
  }
  return;
});
