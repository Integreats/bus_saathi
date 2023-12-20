import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../bus_stops/models/bus_stop.dart';

part 'bus_ticket.freezed.dart';
part 'bus_ticket.g.dart';

@freezed
class BusTicket with _$BusTicket {
  factory BusTicket({
    required String id,
    required String userId,
    required BusStop origin,
    required BusStop destination,
    required double ticketAmount,
    required String paymentId,
    required bool isCheckedIn,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BusTicket;

  factory BusTicket.fromJson(Map<String, dynamic> json) =>
      _$BusTicketFromJson(json);

  factory BusTicket.empty() {
    const uuid = Uuid();

    return BusTicket(
      id: uuid.v4(),
      userId: '',
      origin: BusStop.empty(),
      destination: BusStop.empty(),
      ticketAmount: 0.0,
      paymentId: '',
      isCheckedIn: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
