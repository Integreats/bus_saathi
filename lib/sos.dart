import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmergencyContactsScreen(),
    );
  }
}

class EmergencyContactsScreen extends StatefulWidget {
  @override
  _EmergencyContactsScreenState createState() => _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  List<String> emergencyContacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contacts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter Emergency Contacts:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                // Parse the entered contacts and update the list
                emergencyContacts = value.split(',');
              },
              decoration: InputDecoration(
                hintText: 'Enter comma-separated numbers',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save emergency contacts and navigate to the SOS screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SOSScreen(emergencyContacts: emergencyContacts),
                  ),
                );
              },
              child: Text('Save and Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class SOSScreen extends StatefulWidget {
  final List<String> emergencyContacts;

  SOSScreen({required this.emergencyContacts});

  @override
  _SOSScreenState createState() => _SOSScreenState();
}

class _SOSScreenState extends State<SOSScreen> {
  String sosMessage = 'Emergency! I need your help. My current location is: ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SOS'),
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
          child: Text('Send SOS'),
        ),
      ),
    );
  }
}
