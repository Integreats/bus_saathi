import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../bus_routes/models/route_direction.dart';
import '../../conductor/models/conductor.dart';
import '../../providers/firebase_providers/firestore_provider.dart';
import '../models/bus_stop_alert.dart';
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
  Stream<List<Trip>> getTripsStream({
    required String routeNumber,
    required RouteDirection routeDirection,
    bool? activeTripsOnly,
  });

  Future<List<Trip>> getTrips(Conductor conductor);

  Future<Trip?> fetchExistingTrip({
    required Conductor conductor,
  });

  Future<void> createBusStopAlert({
    required BusStopAlert busStopAlert,
  });
}
