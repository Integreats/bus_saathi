import 'package:bus_saathi/bus_tickets/repositories/bus_tickets_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../app_user/providers/app_user_controller_provider.dart';
import '../models/bus_ticket.dart';
import 'bus_ticket_booking_controller_provider.dart';

final busTicketsPaymentControllerProvider =
    AsyncNotifierProvider.autoDispose<BusTicketsPaymentNotifier, void>(
        BusTicketsPaymentNotifier.new);

class BusTicketsPaymentNotifier extends AutoDisposeAsyncNotifier<void> {
  final _razorpay = Razorpay();

  BusTicket currentBusTicket = BusTicket.empty();

  @override
  void build() async {
    return;
  }

  void checkout(BusTicket busTicket) {
    currentBusTicket = busTicket;
    final busTicketForm = ref.read(busTicketBookingControllerProvider).value!;
    final appUser = ref.read(appUserControllerProvider).value!;

    _razorpay.open({
      'key': 'rzp_test_mM1JFVLbYCzsrn',
      'amount': busTicketForm.ticketAmount.toInt() * 100,
      'name': appUser.name,
      'description':
          'Bus ticket from ${busTicketForm.origin.name} to ${busTicketForm.destination.name}',
      'prefill': {
        'contact': appUser.phoneNumber,
        'email': appUser.emailAddress,
      }
    });
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    currentBusTicket = currentBusTicket.copyWith(
      paymentId: response.paymentId ?? '',
    );
    await ref.read(busTicketsRepositoryProvider).bookTicket(currentBusTicket);
  }

  void _handlePaymentError(PaymentFailureResponse response) async {
    print(response);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print(response);
  }
}
