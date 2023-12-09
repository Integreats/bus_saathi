import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/firebase_providers/firestore_provider.dart';
import '../../services/user_json_parsers.dart';
import '../models/conductor.dart';

final conductorsListProvider = StreamProvider<List<Conductor>>((ref) async* {
  final firestore = ref.watch(firestoreProvider);
  final conductorsStream =
      firestore.collection('conductors').orderBy('name').snapshots();
  await for (final conductorSnapshot in conductorsStream) {
    final parsedConductorsList = await compute(
      UserJsonParsers.parseConductors,
      conductorSnapshot.docs,
    );
    yield parsedConductorsList;
  }
});
