import 'package:cloud_firestore/cloud_firestore.dart';

import '../conductor/models/conductor.dart';

class UserJsonParsers {

  static List<Conductor> parseConductors(
      List<QueryDocumentSnapshot<Object?>> rawConductorsList) {
    List<Conductor> conductorsList = [];

    for (final element in rawConductorsList) {
      final currentConductorAsJson = element.data() as Map<String, dynamic>;

      Conductor currentConductor = Conductor.fromJson(currentConductorAsJson);
      conductorsList.add(currentConductor);
    }
    return conductorsList;
  }
}
