import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../trip_management/models/trip.dart';
import 'current_trip_provider.dart';

final currentTripStreamProvider = StreamProvider<Trip>((ref) async* {
  Trip? currentTrip = ref.watch(currentTripProvider);
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  if (currentTrip != null) {
    final tripStream =
        firestore.collection('trips').doc(currentTrip.id).snapshots();
    await for (final trip in tripStream) {
      yield Trip.fromJson(trip.data()!);
    }
  }
  throw Exception('TRIP_NOT_FOUND');
});
