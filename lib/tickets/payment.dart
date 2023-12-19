import 'package:bus_saathi/l10n/locale.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:bus_saathi/tickets/destination.dart';

class PaymentPage extends StatelessWidget {
  final double ticketAmount;
  final String destination;

  PaymentPage(this.ticketAmount, this.destination);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text($strings.payment),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Destination: $destination'),
            Text('Ticket Amount: $ticketAmount'),
            ElevatedButton(
              onPressed: () {
                // Simulate payment completion
                _showPaymentSuccessDialog(context);
              },
              child: Text($strings.completePayment),
            ),
          ],
        ),
      ),
    );
  }

  void _showPaymentSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text($strings.paymentSuccess),
          content: Text($strings.paymentSuccessful),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Proceed to check destination page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckDestinationPage(destination, ticketAmount),
                  ),
                );
              },
              child: Text($strings.ok),
            ),
          ],
        );
      },
    );
  }
}
