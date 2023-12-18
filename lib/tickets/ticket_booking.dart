// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:bus_saathi/tickets/payment.dart';

// class TicketBookingPage extends StatefulWidget {
//   final String startingLocation;

//   TicketBookingPage(this.startingLocation);

//   @override
//   _TicketBookingPageState createState() => _TicketBookingPageState();
// }

// class _TicketBookingPageState extends State<TicketBookingPage> {
//   String destination = "";
//   int numberOfPersons = 1; // Default number of persons
//   double baseTicketAmount = 10.0;

//   // Example list of bus stops and their distances in kilometers
//   List<Map<String, dynamic>> busStops = [
//     {'name': 'Bus Stop 1', 'distance': 5.0},
//     {'name': 'Bus Stop 2', 'distance': 8.0},
//     {'name': 'Bus Stop 3', 'distance': 12.0},
//     // Add more bus stops as needed
//   ];

//   double calculateTicketAmount() {
//     // Find the index of the destination in the list of bus stops
//     int destinationIndex = busStops.indexWhere((stop) => stop['name'] == destination);

//     if (destinationIndex != -1) {
//       // Calculate the total distance from the starting location to the destination
//       double totalDistance = busStops
//           .sublist(0, destinationIndex + 1)
//           .map<double>((stop) => stop['distance'])
//           .reduce((value, element) => value + element);

//       // Calculate the fare based on the total distance and the base ticket amount
//       return baseTicketAmount * numberOfPersons * totalDistance;
//     } else {
//       // Destination not found in the list of bus stops
//       return -1.0;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Ticket Booking'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text('Starting Location: ${widget.startingLocation}'),
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   destination = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 hintText: 'Enter Destination',
//               ),
//             ),
//             SizedBox(height: 20),
//             Row(
//               children: [
//                 Text('Number of Persons: '),
//                 SizedBox(width: 10),
//                 DropdownButton<int>(
//                   value: numberOfPersons,
//                   onChanged: (value) {
//                     setState(() {
//                       numberOfPersons = value!;
//                     });
//                   },
//                   items: List.generate(10, (index) => index + 1)
//                       .map((int value) => DropdownMenuItem<int>(
//                             value: value,
//                             child: Text(value.toString()),
//                           ))
//                       .toList(),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 double fare = calculateTicketAmount();
//                 if (fare != -1.0) {
//                   // Proceed to payment page
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => PaymentPage(fare, destination),
//                     ),
//                   );
//                 } else {
//                   // Show an error message if the destination is not found
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: Text('Error'),
//                         content: Text('Destination not found in the list of bus stops.'),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: Text('OK'),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 }
//               },
//               child: Text('Proceed to Payment'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:bus_saathi/tickets/payment.dart';

class TicketBookingPage extends StatefulWidget {
  final String startingLocation;

  TicketBookingPage(this.startingLocation);

  @override
  _TicketBookingPageState createState() => _TicketBookingPageState();
}

class _TicketBookingPageState extends State<TicketBookingPage> {
  String destination = "";
  int numberOfPersons = 1; // Default number of persons
  double baseTicketAmount = 10.0;
  double additionalChargePerBusStop = 5.0; // Additional charge for each bus stop

  // Example list of bus stops and their distances in kilometers
  List<Map<String, dynamic>> busStops = [
    {'name': 'Bus Stop 1', 'distance': 5.0},
    {'name': 'Bus Stop 2', 'distance': 8.0},
    {'name': 'Bus Stop 3', 'distance': 12.0},
    // Add more bus stops as needed
  ];

  double calculateTicketAmount() {
    // Find the index of the destination in the list of bus stops
    int destinationIndex = busStops.indexWhere((stop) => stop['name'] == destination);

    if (destinationIndex != -1) {
      // Calculate the total distance from the starting location to the destination
      double totalDistance = busStops
          .sublist(0, destinationIndex + 1)
          .map<double>((stop) => stop['distance'])
          .reduce((value, element) => value + element);

      // Calculate the additional charge based on the number of bus stops in between
      int numberOfBusStops = destinationIndex;
      double additionalCharge = numberOfBusStops * additionalChargePerBusStop;

      // Calculate the fare based on the total distance, additional charge, and the base ticket amount
      return baseTicketAmount * numberOfPersons * (totalDistance + additionalCharge);
    } else {
      // Destination not found in the list of bus stops
      return -1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Starting Location: ${widget.startingLocation}'),
            TextField(
              onChanged: (value) {
                setState(() {
                  destination = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter Destination',
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Number of Persons: '),
                SizedBox(width: 10),
                DropdownButton<int>(
                  value: numberOfPersons,
                  onChanged: (value) {
                    setState(() {
                      numberOfPersons = value!;
                    });
                  },
                  items: List.generate(10, (index) => index + 1)
                      .map((int value) => DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          ))
                      .toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double fare = calculateTicketAmount();
                if (fare != -1.0) {
                  // Proceed to payment page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(fare, destination),
                    ),
                  );
                } else {
                  // Show an error message if the destination is not found
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Destination not found in the list of bus stops.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
