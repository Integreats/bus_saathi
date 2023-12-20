import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_user/providers/app_user_controller_provider.dart';
import '../../providers/firebase_providers/firestore_provider.dart';
import '../models/bus_ticket.dart';
import 'firebase_bus_tickets_repository.dart';

final busTicketsRepositoryProvider = Provider<BusTicketsRepository>((ref) {
  final firestore = ref.watch(firestoreProvider);
  final appUser = ref.watch(appUserControllerProvider).value;
  return FirebaseBusTicketsRepository(
    appUser: appUser,
    firestore: firestore,
  );
});

abstract class BusTicketsRepository {
  Future<void> bookTicket(BusTicket busTicketForm);

  Stream<List<BusTicket>> userBusTicketsListStream();
}
