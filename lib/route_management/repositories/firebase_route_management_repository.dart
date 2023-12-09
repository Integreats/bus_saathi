import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/bus_route.dart';
import '../models/bus_stop.dart';
import '../services/route_json_parser.dart';
import 'route_management_repository.dart';

class FirebaseRouteManagementRepository extends RouteManagementRepository {
  FirebaseRouteManagementRepository({
    required FirebaseFirestore? firestore,
  }) : firestore = firestore ?? FirebaseFirestore.instance {
    initialize();
  }

  late final FirebaseFirestore firestore;

  CollectionReference<Map<String, dynamic>> get busRoutesCollection =>
      firestore.collection('busRoutes');
  CollectionReference<Map<String, dynamic>> get busStopsCollection =>
      firestore.collection('busStops');

  Future<void> initialize() async {
    firestore.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  }

  @override
  Future<void> addRoute(BusRoute busRoute) async {
    final rawBusRoute = RouteJsonParsers.parseBusRouteToRawBusRoute(busRoute);
    await busRoutesCollection.doc(rawBusRoute.id).set(rawBusRoute.toJson());
  }

  @override
  Future<void> updateRoute(BusRoute busRoute) async {
    busRoute = busRoute.copyWith(
      updatedAt: DateTime.now(),
    );
    final rawBusRoute = RouteJsonParsers.parseBusRouteToRawBusRoute(busRoute);
    await busRoutesCollection
        .doc(rawBusRoute.id)
        .update(rawBusRoute.copyWith(updatedAt: DateTime.now()).toJson());
  }

  @override
  Future<void> deleteRoute(BusRoute busRoute) async {
    await busRoutesCollection.doc(busRoute.id).delete();
  }

  @override
  Future<void> addStop(BusStop busStop) async {
    await busStopsCollection.doc(busStop.id).set(busStop.toJson());
  }

  @override
  Future<void> updateStop(BusStop busStop) async {
    busStop = busStop.copyWith(
      updatedAt: DateTime.now(),
    );
    await busStopsCollection.doc(busStop.id).update(busStop.toJson());
  }

  @override
  Future<void> deleteStop(BusStop busStop) async {
    await deleteBusStopFromBusRoute(busStop);
    await busStopsCollection.doc(busStop.id).delete();
  }

  Future<void> deleteBusStopFromBusRoute(BusStop busStop) async {
    final busRouteCollection = busRoutesCollection;
    final WriteBatch batch = firestore.batch();

    final QuerySnapshot stopListSnapshot = await busRouteCollection
        .where('stops', arrayContains: busStop.id)
        .get();
    for (final doc in stopListSnapshot.docs) {
      final List<String> busStopIds = List<String>.from(doc['stops']);
      busStopIds.remove(busStop.id);
      final docRef = busRouteCollection.doc(doc.id);
      final dateTime = DateTime.now();
      batch.update(docRef, {
        'stops': busStopIds,
        'updatedAt': Timestamp.fromDate(dateTime),
      });
    }

    final QuerySnapshot destinationSnapshot = await busRouteCollection
        .where('destination', isEqualTo: busStop.id)
        .get();
    for (final doc in destinationSnapshot.docs) {
      final List<String> busStopIds = List<String>.from(doc['stops']);
      final docRef = busRouteCollection.doc(doc.id);
      if (busStopIds.isNotEmpty) {
        final newDestination = busStopIds.last;
        busStopIds.removeLast();
        final dateTime = DateTime.now();
        batch.update(docRef, {
          'destination': newDestination,
          'stops': busStopIds,
          'updatedAt': Timestamp.fromDate(dateTime)
        });
      } else {
        batch.delete(docRef);
      }
    }

    final QuerySnapshot originSnapshot =
        await busRouteCollection.where('origin', isEqualTo: busStop.id).get();
    for (final doc in originSnapshot.docs) {
      final List<String> busStopIds = List<String>.from(doc['stops']);
      final docRef = busRouteCollection.doc(doc.id);
      if (busStopIds.isNotEmpty) {
        final origin = busStopIds.first;
        busStopIds.removeAt(0);
        final dateTime = DateTime.now();
        batch.update(docRef, {
          'origin': origin,
          'stops': busStopIds,
          'updatedAt': Timestamp.fromDate(dateTime)
        });
      } else {
        batch.delete(docRef);
      }
    }
    await batch.commit();
  }
}
