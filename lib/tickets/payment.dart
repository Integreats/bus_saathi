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
        title: Text('Payment'),
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
              child: Text('Complete Payment'),
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
          title: Text('Payment Success'),
          content: Text('Payment successful!'),
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
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
