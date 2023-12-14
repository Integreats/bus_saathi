import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/bus_stop.dart';
import '../repositories/bus_stop_repository.dart';

final busStopsListProvider = StreamProvider<List<BusStop>>((ref) async* {
  final busStopRepository = ref.watch(busStopRepositoryProvider);
  final busStopsStream = busStopRepository.getBusStopsListStream();
  await for (final busStops in busStopsStream) {
    yield busStops;
  }
});
