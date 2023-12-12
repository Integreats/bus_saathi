import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../conductor/models/conductor.dart';
import '../../providers/firebase_providers/firestore_provider.dart';
import '../models/trip.dart';
import 'firebase_trip_repostiory.dart';

final tripRepositoryProvider = Provider<TripRepository>((ref) {
  final firestore = ref.watch(firestoreProvider);

  return FirebaseTripRepository(
    firestore: firestore,
  );
});

abstract class TripRepository {
  /// Get [Trip] by trip id
  Stream<Trip> getTripStream(String id);

  Future<List<Trip>> getTrips(Conductor conductor);

  Future<Trip?> fetchExistingTrip({
    required Conductor conductor,
  });
}
