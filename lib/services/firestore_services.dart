import 'package:cloud_firestore/cloud_firestore.dart';

import '../trip_management/models/trip.dart';
import '../user_management/conductor/models/conductor.dart';
import 'conductor_trip_service.dart';

class FirestoreServices {
  static Future<Conductor> getConductorByPhoneNumber(String phoneNumber) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
        .collection('conductors')
        .where('phoneNumber', isEqualTo: int.parse(phoneNumber))
        .get();
    Conductor conductor;
    if (querySnapshot.docs.isNotEmpty) {
      conductor = Conductor.fromJson(
        querySnapshot.docs.first.data(),
      );
      return conductor;
    } else {
      throw Exception('conductor not found');
    }
  }

  static Future<Conductor> getConductorByBusNumber(String busNumber) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
        .collection('conductors')
        .where(
          "busDetails.numberPlateNumber",
          isEqualTo: busNumber.toUpperCase(),
        )
        .get();
    Conductor conductor;
    if (querySnapshot.docs.isNotEmpty) {
      conductor = Conductor.fromJson(
        querySnapshot.docs.first.data(),
      );
      return conductor;
    } else {
      throw Exception('conductor not found');
    }
  }

  static Future<Trip?> getCurrentTripByConductorId(String conductorId) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    Query conuductorTripsQuery = firestore.collection('trips').where(
          'conductor.id',
          isEqualTo: conductorId,
        );
    QuerySnapshot fetchedTrips = await conuductorTripsQuery.get();
    List<Trip> conductorTrips = fetchedTrips.docs.map((e) {
      Map<String, dynamic> tripAsMap = e.data() as Map<String, dynamic>;
      Trip trip = Trip.fromJson(Map<String, dynamic>.from(tripAsMap));
      return trip;
    }).toList();
    Trip? currentTrip = ConductorTripsServices.getCurrentTrip(conductorTrips);
    return currentTrip;
  }
}
