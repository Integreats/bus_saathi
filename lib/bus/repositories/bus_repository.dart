import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/firebase_providers/firestore_provider.dart';
import '../models/bus.dart';
import 'firebase_bus_repository.dart';

final busRepositoryProvider = Provider<BusRepository>((ref) {
  final firestore = ref.watch(firestoreProvider);
  return FirebaseBusRepository(
    firestore: firestore,
  );
});

abstract class BusRepository {
  Stream<List<Bus>> fetchBusesListStream();

  Future<Bus> fetchConductorBus(String busId);
}
