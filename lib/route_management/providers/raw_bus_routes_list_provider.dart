import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';

import '../helpers/route_firestore_helper.dart';
import '../models/raw_bus_route.dart';
import '../services/route_json_parser.dart';

final rawBusRoutesListProvider =
    StreamProvider<List<RawBusRoute>>((ref) async* {
  final busRoutesStream = RouteFirestoreHelper.getBusRoutesCollectionStream();
  await for (final busRoutesSnapshot in busRoutesStream) {
    final parsedList = await compute(
        RouteJsonParsers.parseRawBusRoutes, busRoutesSnapshot.docs);
    yield parsedList;
  }
});
