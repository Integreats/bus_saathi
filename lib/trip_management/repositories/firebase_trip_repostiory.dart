import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../user_management/conductor/models/conductor.dart';
import '../models/bus_stop_crossed.dart';
import '../models/trip.dart';
import '../services/trip_json_parser.dart';
import 'trip_repository.dart';

class FirebaseTripRepository extends TripRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<Trip> createTrip(Trip trip) async {
    await firestore.collection('trips').doc(trip.id).set(
          trip.toJson(),
        );
    return trip;
  }

  @override
  Future<void> deleteTrip(String id) {
    // TODO: implement deleteTrip
    throw UnimplementedError();
  }

  @override
  Future<Trip> getTrip(String id) {
    // TODO: implement getTrip
    throw UnimplementedError();
  }

  @override
  Future<List<Trip>> getTrips(Conductor conductor) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final conuductorTripsQuery = firestore
        .collection('trips')
        .where('conductor.id', isEqualTo: conductor.id);

    final querySnapshot = await conuductorTripsQuery.get();
    final tripsList =
        await compute(TripJsonParsers.parseTrips, querySnapshot.docs);

    return tripsList;
  }

  @override
  Future<Trip> updateTrip(Trip trip) {
    // TODO: implement updateTrip
    throw UnimplementedError();
  }

  @override
  Future<void> updateLiveLocation({
    required String tripId,
    required List<Map<String, dynamic>> liveLocationsAsRaw,
    required Map<String, BusStopCrossed>? busStopsCrossed,
  }) async {
    await firestore.collection('trips').doc(tripId).update({
      'liveLocation': liveLocationsAsRaw,
    });
  }

  @override
  Future<void> updateBusStopsCrossed(
      {required String tripId,
      required Map<String, BusStopCrossed> busStopsCrossed}) async {
    await firestore.collection('trips').doc(tripId).update({
      'busStopsCrossed':
          busStopsCrossed.map((key, value) => MapEntry(key, value.toJson())),
    });
  }

  @override
  Future<void> endTrip({
    required String tripId,
    required List<Map<String, dynamic>> liveLocationsAsRaw,
  }) async {
    final now = DateTime.now();
    await firestore.collection('trips').doc(tripId).update({
      'isEnded': true,
      'liveLocation': liveLocationsAsRaw,
      'endDateTime': Timestamp.fromDate(now),
    });
  }

  @override
  Future<Trip?> fetchExistingTrip({required Conductor conductor}) async {
    final trips = await getTrips(conductor);
    final trip = trips.singleWhere((element) {
      if (element.startDateTime.isBefore(DateTime.now()) &&
          element.endDateTime.isAfter(DateTime.now())) {
        return true;
      } else {
        return false;
      }
    });
    return trip;
  }
}
