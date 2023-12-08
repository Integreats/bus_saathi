import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../helpers/user_firestore_helper.dart';
import '../../services/user_json_parsers.dart';
import '../models/conductor.dart';

final conductorsListProvider = StreamProvider<List<Conductor>>((ref) async* {
  final conductorsStream = UserFirestoreHelper.getConductorsCollectionStream();
  await for (final conductorSnapshot in conductorsStream) {
    final parsedConductorsList = await compute(
      UserJsonParsers.parseConductors,
      conductorSnapshot.docs,
    );
    yield parsedConductorsList;
  }
});
