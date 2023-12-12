import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/trip.dart';
import '../repositories/trip_repository.dart';

final tripStreamProvider =
    StreamProvider.family<Trip, String>((ref, tripId) async* {
  final tripRepository = ref.watch(tripRepositoryProvider);
  final tripStream = tripRepository.getTripStream(tripId);

  await for (final trip in tripStream) {
    yield trip;
  }
});
