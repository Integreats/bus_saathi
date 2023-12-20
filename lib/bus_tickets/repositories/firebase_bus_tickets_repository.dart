import 'package:cloud_firestore/cloud_firestore.dart';

import '../../app_user/models/app_user.dart';
import '../models/bus_ticket.dart';
import 'bus_tickets_repository.dart';

class FirebaseBusTicketsRepository extends BusTicketsRepository {
  FirebaseBusTicketsRepository({
    required this.appUser,
    required FirebaseFirestore? firestore,
  }) : firestore = firestore ?? FirebaseFirestore.instance;

  final AppUser? appUser;
  final FirebaseFirestore firestore;

  final CollectionReference<Map<String, dynamic>> busTicketsCollection =
      FirebaseFirestore.instance.collection('busTickets');

  @override
  Future<void> bookTicket(BusTicket busTicketForm) async {
    await busTicketsCollection
        .doc(busTicketForm.id)
        .set(busTicketForm.toJson());
  }

  @override
  Stream<List<BusTicket>> userBusTicketsListStream() async* {
    final busTicketsStream = busTicketsCollection
        .where('userId', isEqualTo: appUser!.id)
        .orderBy('createdAt')
        .snapshots();

    await for (final busTickets in busTicketsStream) {
      final List<BusTicket> busTicketsList = [];
      for (final busTicket in busTickets.docs) {
        final parsedBusTicket = BusTicket.fromJson(busTicket.data());
        busTicketsList.add(parsedBusTicket);
      }
      yield busTicketsList;
    }
  }
}
