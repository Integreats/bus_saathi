import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../helpers/route_firestore_helper.dart';
import '../models/bus_route.dart';
import '../services/route_json_parser.dart';

final busRouteListProvider = StreamProvider<List<BusRoute>>((ref) async* {
  final rawBusStream = RouteFirestoreHelper.getBusRoutesCollectionStream();
  final mapStream = RouteFirestoreHelper.getBusStopsCollectionStream();

  try {
    await for (final rawBusRoute in rawBusStream) {
      final busStopMap = await mapStream.first;
      final parsedBusStopMap = await compute(
        RouteJsonParsers.parseStopsMap,
        busStopMap.docs,
      );

      final busRouteData = await compute(
        RouteJsonParsers.parseBusRoutes,
        {
          'rawBusRouteDocs': rawBusRoute.docs,
          'parsedBusStopMap': parsedBusStopMap,
        },
      );
      yield busRouteData;
    }
  } finally {}
});
