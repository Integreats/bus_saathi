import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final locationStreamProvider = StreamProvider<Position>((ref) async* {
  await Geolocator.requestPermission();
  final locationStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
    distanceFilter: 200,
  ));
  await for (final location in locationStream) {
    yield location;
  }
});
