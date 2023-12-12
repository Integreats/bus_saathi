import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/bus.dart';
import '../repositories/bus_repository.dart';

final busesListProvider = StreamProvider<List<Bus>>((ref) async* {
  final busRepository = ref.watch(busRepositoryProvider);
  final busesListStream = busRepository.fetchBusesListStream();

  await for (final buses in busesListStream) {
    yield buses;
  }
});
