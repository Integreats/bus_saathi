import 'package:bus_saathi/app_user/providers/app_user_controller_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../bus_stops/models/bus_stop.dart';
import '../models/bus_ticket.dart';

final busTicketBookingControllerProvider =
    AsyncNotifierProvider<BusTicketBookingNotifier, BusTicket>(
        BusTicketBookingNotifier.new);

class BusTicketBookingNotifier extends AsyncNotifier<BusTicket> {
  final _baseTicketAmount = 5.0;

  final _costPerKm = 2.0;

  @override
  BusTicket build() {
    final appUser = ref.watch(appUserControllerProvider).value;
    return BusTicket.empty().copyWith(
      userId: appUser!.id,
    );
  }

  void setOrigin(BusStop origin) {
    state = AsyncValue.data(
      state.value!.copyWith(origin: origin),
    );
  }

  void setDestination(BusStop destination) {
    state = AsyncValue.data(
      state.value!.copyWith(destination: destination),
    );
    calculateTicketAmount();
  }

  void setTicketAmount(double ticketAmount) {
    state = AsyncValue.data(
      state.value!.copyWith(
        ticketAmount: double.parse(
          ticketAmount.toStringAsFixed(2),
        ),
      ),
    );
  }

  void calculateTicketAmount() {
    final distance = Geolocator.distanceBetween(
      state.value!.origin.latitude,
      state.value!.origin.longitude,
      state.value!.destination.latitude,
      state.value!.destination.longitude,
    );

    final totalAmount = _baseTicketAmount + ((distance / 1000) * _costPerKm);

    state = AsyncValue.data(
      state.value!.copyWith(
        ticketAmount: double.parse(
          totalAmount.toStringAsFixed(2),
        ),
      ),
    );
  }
}
