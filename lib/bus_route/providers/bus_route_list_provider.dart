import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bus_routes/models/bus_route.dart';
import '../../bus_stops/services/bus_stop_json_parser.dart';
import '../../providers/firebase_providers/firestore_provider.dart';

import '../services/bus_route_json_parser.dart';

final busRouteListProvider = StreamProvider<List<BusRoute>>((ref) async* {
  final firestore = ref.watch(firestoreProvider);
  final rawBusStream =
      firestore.collection('busRoutes').orderBy('updatedAt').snapshots();
  final mapStream =
      firestore.collection('busStops').orderBy('name').snapshots();

  try {
    await for (final rawBusRoute in rawBusStream) {
      final busStopMap = await mapStream.first;
      final parsedBusStopMap = await compute(
        BusStopJsonParser.parseStopsMap,
        busStopMap.docs,
      );

      final busRouteData = await compute(
        BusRouteJsonParsers.parseBusRoutes,
        {
          'rawBusRouteDocs': rawBusRoute.docs,
          'parsedBusStopMap': parsedBusStopMap,
        },
      );
      yield busRouteData;
    }
  } finally {}
});
