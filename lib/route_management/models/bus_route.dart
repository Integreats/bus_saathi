import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../json_converters/date_time_json_converter.dart';
import 'bus_stop.dart';

part 'bus_route.freezed.dart';
part 'bus_route.g.dart';

@freezed
class BusRoute with _$BusRoute {
  factory BusRoute({
    required String id,
    required BusStop origin,
    required BusStop destination,
    required List<BusStop> stops,
    @DateTimeJsonConverter() required DateTime createdAt,
    @DateTimeJsonConverter() required DateTime updatedAt,
  }) = _BusRoute;

  factory BusRoute.fromJson(Map<String, dynamic> json) =>
      _$BusRouteFromJson(json);

  factory BusRoute.empty() {
    const uuid = Uuid();
    return BusRoute(
      id: uuid.v4(),
      origin: BusStop.empty(),
      destination: BusStop.empty(),
      stops: <BusStop>[],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
