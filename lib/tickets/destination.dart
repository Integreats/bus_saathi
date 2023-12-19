import 'package:bus_saathi/tickets/payment.dart';
import 'package:bus_saathi/tickets/ticket_booking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../l10n/locale.dart';

class CheckDestinationPage extends StatefulWidget {
  final String destination;
  final double ticketAmount;

  const CheckDestinationPage(this.destination, this.ticketAmount, {super.key});

  @override
  _CheckDestinationPageState createState() => _CheckDestinationPageState();
}

class _CheckDestinationPageState extends State<CheckDestinationPage> {
  bool gotDownAtDestination = false;
  String startingLocation = "Unknown"; // Set default starting location

  @override
  void initState() {
    super.initState();
    _getStartingLocation();
  }

  Future<void> _getStartingLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Use the position information to determine the starting location.
      // For simplicity, just showing the coordinates in this example.
      setState(() {
        startingLocation =
            "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
      });

      // Replace this logic with your actual check for the destination arrival
      gotDownAtDestination =
          _isAtDestination(position.latitude, position.longitude);
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  // Replace this with your actual logic to check if the user is at the destination
  bool _isAtDestination(double currentLatitude, double currentLongitude) {
    // Replace these coordinates with the actual coordinates of the destination bus stop
    double destinationLatitude =
        37.7749; // Example: Replace with the actual latitude of the destination
    double destinationLongitude =
        -122.4194; // Example: Replace with the actual longitude of the destination
    double distanceThreshold =
        100; // Set a distance threshold for considering arrival

    double distance = Geolocator.distanceBetween(
      currentLatitude,
      currentLongitude,
      destinationLatitude,
      destinationLongitude,
    );

    return distance <= distanceThreshold;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text($strings.checkDestination),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Destination: ${widget.destination}'),
            Text('Ticket Amount: ${widget.ticketAmount}'),
            Text('Starting Location: $startingLocation'),
            if (!gotDownAtDestination)
              Text(
                $strings.wrongDestination,
                style: const TextStyle(color: Colors.red),
              ),
            ElevatedButton(
              onPressed: () {
                if (!gotDownAtDestination) {
                  // Proceed to pay the remaining balance
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PaymentPage(widget.ticketAmount, widget.destination),
                    ),
                  );
                } else {
                  // Allow the user to book another ticket with the updated starting location
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TicketBookingPage(startingLocation),
                    ),
                  );
                }
              },
              child:  Text($strings.ok),
            ),
          ],
        ),
      ),
    );
  }
}
