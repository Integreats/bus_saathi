import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/bus.dart';
import '../services/bus_json_parser.dart';
import 'bus_repository.dart';

class FirebaseBusRepository extends BusRepository {
  FirebaseBusRepository({
    required FirebaseFirestore? firestore,
  }) : firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore firestore;

  CollectionReference<Map<String, dynamic>> get busCollection =>
      firestore.collection('buses');

  @override
  Stream<List<Bus>> fetchBusesListStream() async* {
    final busStream = busCollection.snapshots();
    List<Bus> buses = [];
    await for (final busSnapshot in busStream) {
      buses = BusJsonParsers.parseBuses(busSnapshot.docs);
      yield buses;
    }
  }

  @override
  Future<Bus> fetchConductorBus(String busId) async {
    final rawBusData = await busCollection.doc(busId).get();
    final bus = Bus.fromJson(rawBusData.data() as Map<String, dynamic>);
    return bus;
  }
}
