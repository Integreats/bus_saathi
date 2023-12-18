import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/firebase_providers/firestore_provider.dart';
import '../models/bus_stop.dart';
import 'firebase_bus_stop_repository.dart';

final busStopRepositoryProvider = Provider<BusStopRepository>((ref) {
  final firestore = ref.watch(firestoreProvider);
  return FirebaseBusStopRepository(
    firestore: firestore,
  );
});

abstract class BusStopRepository {
  Stream<List<BusStop>> getBusStopsListStream();
}
