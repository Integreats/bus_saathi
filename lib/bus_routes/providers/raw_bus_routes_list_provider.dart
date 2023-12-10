import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/firebase_providers/firestore_provider.dart';
import '../models/raw_bus_route.dart';
import '../services/bus_route_json_parser.dart';

final rawBusRoutesListProvider =
    StreamProvider<List<RawBusRoute>>((ref) async* {
  final firestore = ref.watch(firestoreProvider);
  final busRoutesStream =
      firestore.collection('busRoutes').orderBy('updatedAt').snapshots();
  await for (final busRoutesSnapshot in busRoutesStream) {
    final parsedList = await compute(
        BusRouteJsonParsers.parseRawBusRoutes, busRoutesSnapshot.docs);
    yield parsedList;
  }
});
