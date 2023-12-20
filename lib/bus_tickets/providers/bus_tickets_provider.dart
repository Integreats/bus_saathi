import 'package:bus_saathi/bus_tickets/models/bus_ticket.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/bus_tickets_repository.dart';

final userBusTicketsListProvider =
    StreamProvider<List<BusTicket>>((ref) async* {
  final busTicketsRepository = ref.watch(busTicketsRepositoryProvider);
  await for (final busTicketsList
      in busTicketsRepository.userBusTicketsListStream()) {
    yield busTicketsList;
  }
});
