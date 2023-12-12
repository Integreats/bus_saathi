import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../bus_stops/models/bus_stop.dart';
import '../json_converters/date_time_json_converter.dart';
import 'route_direction.dart';

part 'bus_route.freezed.dart';
part 'bus_route.g.dart';

@freezed
class BusRoute with _$BusRoute {
  factory BusRoute({
    required String id,
    required String routeNumber,
    required RouteDirection direction,
    required BusStop origin,
    required List<BusStop> stops,
    required BusStop destination,
    @DateTimeJsonConverter() required DateTime createdAt,
    @DateTimeJsonConverter() required DateTime updatedAt,
  }) = _BusRoute;

  factory BusRoute.fromJson(Map<String, dynamic> json) =>
      _$BusRouteFromJson(json);

  factory BusRoute.empty() {
    const uuid = Uuid();
    return BusRoute(
      id: uuid.v4(),
      routeNumber: '',
      direction: RouteDirection.forward,
      origin: BusStop.empty(),
      stops: <BusStop>[],
      destination: BusStop.empty(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
