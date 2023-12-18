import 'package:bus_saathi/themes/light_theme.dart';
import 'package:bus_saathi/widgets/buttons/elevated_loader_button.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:bus_saathi/tickets/ticket_booking.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String startingLocation = "Loading...";

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

      // Use the position information to determine the nearest bus stop.
      String nearestBusStop = await getNearestBusStop(position.latitude, position.longitude);

      setState(() {
        startingLocation = nearestBusStop;
      });
    } catch (e) {
      print("Error getting location: $e");
      setState(() {
        startingLocation = "Error fetching location";
      });
    }
  }

  Future<String> getNearestBusStop(double latitude, double longitude) async {
    // Implement your logic for finding the nearest bus stop
    // For simplicity, just showing the coordinates.
    return "Nearest Bus Stop: Latitude: $latitude, Longitude: $longitude";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Ticketing '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Starting Location: $startingLocation'),
            ElevatedLoaderButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TicketBookingPage(startingLocation)),
                );
              },
              label: Text('Book Ticket'),
            ),
          ],
        ),
      ),
    );
  }
}
