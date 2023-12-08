import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../helpers/route_firestore_helper.dart';
import '../models/bus_stop.dart';
import '../services/route_json_parser.dart';

final busStopsMapProvider = StreamProvider<Map<String, BusStop>>((ref) async* {
  final busStopsStream = RouteFirestoreHelper.getBusStopsCollectionStream();

  await for (final busStopSnaspshot in busStopsStream) {
    final parsedStopsList = await compute(
      RouteJsonParsers.parseStopsMap,
      busStopSnaspshot.docs,
    );
    yield parsedStopsList;
  }
});
