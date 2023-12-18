import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/emergency_contact.dart';
import '../repositories/sos_repository.dart';

final emergencyContactsListProvider =
    StreamProvider<List<EmergencyContact>>((ref) async* {
  final sosRepository = ref.watch(sosRepositoryProvider);
  final emergencyContactsStream = sosRepository.getEmergencyContactsList();

  await for (final emergencyContacts in emergencyContactsStream) {
    yield emergencyContacts;
  }
});
