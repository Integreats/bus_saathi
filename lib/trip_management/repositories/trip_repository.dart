import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../conductor/models/conductor.dart';
import '../../providers/firebase_providers/firestore_provider.dart';
import '../models/bus_stop_crossed.dart';
import '../models/trip.dart';
import 'firebase_trip_repostiory.dart';

final tripRepositoryProvider = Provider<TripRepository>((ref) {
  final firestore = ref.watch(firestoreProvider);

  return FirebaseTripRepository(
    firestore: firestore,
  );
});

abstract class TripRepository {
  Future<List<Trip>> getTrips(Conductor conductor);

  Future<Trip> getTrip(String id);

  Future<Trip> createTrip(Trip trip);

  Future<Trip> updateTrip(Trip trip);

  Future<void> updateLiveLocation({
    required String tripId,
    required List<Map<String, dynamic>> liveLocationsAsRaw,
    required Map<String, BusStopCrossed>? busStopsCrossed,
  });

  Future<void> updateBusStopsCrossed({
    required String tripId,
    required Map<String, BusStopCrossed> busStopsCrossed,
  });

  Future<void> endTrip({
    required String tripId,
    required List<Map<String, dynamic>> liveLocationsAsRaw,
  });

  Future<Trip?> fetchExistingTrip({
    required Conductor conductor,
  });

  Future<void> deleteTrip(String id);
}
