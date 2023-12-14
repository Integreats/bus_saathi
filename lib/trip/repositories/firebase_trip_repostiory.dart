import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../bus_routes/models/route_direction.dart';
import '../../conductor/models/conductor.dart';
import '../../trip_management/services/trip_json_parser.dart';
import '../models/trip.dart';
import 'trip_repository.dart';

class FirebaseTripRepository extends TripRepository {
  FirebaseTripRepository({
    required FirebaseFirestore? firestore,
  }) : firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore firestore;

  CollectionReference<Map<String, dynamic>> get tripsCollection =>
      firestore.collection('trips');

  @override
  Stream<Trip> getTripStream(String id) async* {
    final tripStream = tripsCollection.doc(id).snapshots();

    await for (final trip in tripStream) {
      if (!trip.exists) {
        throw Exception('Trip does not exist');
      }
      final parsedTrip = Trip.fromJson(trip.data()!);

      yield parsedTrip;
    }
  }

  @override
  Stream<List<Trip>> getTripsStream({
    required String routeNumber,
    required RouteDirection routeDirection,
    bool? activeTripsOnly,
  }) async* {
    Query tripsStreamQuery = tripsCollection
        .where('tripRoute.routeNumber', isEqualTo: routeNumber.trim().toUpperCase())
        .where(
          'tripRoute.direction',
          isEqualTo: routeDirection.name,
        );

    if (activeTripsOnly != null) {
      tripsStreamQuery =
          tripsStreamQuery.where('isEnded', isEqualTo: !activeTripsOnly);
    }

    final tripsStream = tripsStreamQuery.snapshots();
    await for (final trips in tripsStream) {
      final List<Trip> tripsList = [];
      for (final trip in trips.docs) {
        final parsedTrip = Trip.fromJson(trip.data() as Map<String, dynamic>);
        tripsList.add(parsedTrip);
      }
      yield tripsList;
    }
  }

  @override
  Future<List<Trip>> getTrips(Conductor conductor) async {
    final conuductorTripsQuery =
        tripsCollection.where('conductor.id', isEqualTo: conductor.id);

    final querySnapshot = await conuductorTripsQuery.get();
    final tripsList =
        await compute(TripJsonParsers.parseTrips, querySnapshot.docs);

    return tripsList;
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
