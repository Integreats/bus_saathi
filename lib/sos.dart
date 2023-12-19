import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EmergencyContactsScreen(),
    );
  }
}

class EmergencyContactsScreen extends StatefulWidget {
  const EmergencyContactsScreen({super.key});

  @override
  _EmergencyContactsScreenState createState() =>
      _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  List<String> emergencyContacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter Emergency Contacts:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                // Parse the entered contacts and update the list
                emergencyContacts = value.split(',');
              },
              decoration: const InputDecoration(
                hintText: 'Enter comma-separated numbers',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save emergency contacts and navigate to the SOS screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SOSScreen(emergencyContacts: emergencyContacts),
                  ),
                );
              },
              child: const Text('Save and Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class SOSScreen extends StatefulWidget {
  final List<String> emergencyContacts;

  const SOSScreen({super.key, required this.emergencyContacts});

  @override
  _SOSScreenState createState() => _SOSScreenState();
}

class _SOSScreenState extends State<SOSScreen> {
  String sosMessage = 'Emergency! I need your help. My current location is: ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOS'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Get current location
            Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high,
            );

            // Build SOS message with location
            String locationMessage =
                'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
            String fullMessage = '$sosMessage $locationMessage';

            // Open default messaging app with pre-filled message
            String numbers = widget.emergencyContacts.join(',');
            String url = 'sms:$numbers?body=$fullMessage';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              print('Could not launch $url');
            }
          },
          child: const Text('Send SOS'),
        ),
      ),
    );
  }
}
