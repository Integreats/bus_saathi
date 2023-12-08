import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user_management/conductor/models/conductor.dart';
import '../json_converters/date_time_json_converter.dart';
import 'bus_stop_crossed.dart';
import 'live_location.dart';
import 'trip_route.dart';

part 'trip.freezed.dart';
part 'trip.g.dart';

@freezed
class Trip with _$Trip {
  const factory Trip({
    required String id,
    @DateTimeJsonConverter() required DateTime startDateTime,
    @DateTimeJsonConverter() required DateTime endDateTime,
    required Conductor conductor,
    required List<LiveLocation> liveLocation,
    required bool isEnded,
    required TripRoute? tripRoute,
    required Map<String, BusStopCrossed>? busStopsCrossed,
  }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
}
