import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/firebase_providers/firestore_provider.dart';
import '../models/bus_stop.dart';
import '../services/route_json_parser.dart';

final busStopsListProvider = StreamProvider<List<BusStop>>((ref) async* {
  final firestore = ref.watch(firestoreProvider);
  final busStopsStream =
      firestore.collection('busStops').orderBy('name').snapshots();

  await for (final busStopSnaspshot in busStopsStream) {
    final parsedStopsList = await compute(
      RouteJsonParsers.parseStops,
      busStopSnaspshot.docs,
    );
    yield parsedStopsList;
  }
});
