import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../json_converters/date_time_json_converter.dart';
import 'route_direction.dart';

part 'raw_bus_route.freezed.dart';
part 'raw_bus_route.g.dart';

@freezed
class RawBusRoute with _$RawBusRoute {
  factory RawBusRoute({
    required String id,
    required String routeNumber,
    required RouteDirection direction,
    required String origin,
    required List<String> stops,
    required String destination,
    @DateTimeJsonConverter() required DateTime createdAt,
    @DateTimeJsonConverter() required DateTime updatedAt,
  }) = _RawBusRoute;

  factory RawBusRoute.fromJson(Map<String, dynamic> json) =>
      _$RawBusRouteFromJson(json);

  factory RawBusRoute.empty() {
    const uuid = Uuid();
    return RawBusRoute(
      id: uuid.v4(),
      origin: '',
      destination: '',
      routeNumber: '',
      direction: RouteDirection.forward,
      stops: <String>[],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
