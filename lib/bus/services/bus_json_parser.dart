import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/bus.dart';

class BusJsonParsers {
  static List<Bus> parseBuses(List<QueryDocumentSnapshot<Object?>> rawBusList) {
    List<Bus> busList = [];
    for (final element in rawBusList) {
      final currentAsJson = element.data() as Map<String, dynamic>;
      Bus currentBus = Bus.fromJson(currentAsJson);
      busList.add(currentBus);
    }
    return busList;
  }
}
