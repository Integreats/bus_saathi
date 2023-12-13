import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../bus_routes/models/route_direction.dart';
import '../../bus_stops/models/bus_stop.dart';

part 'trip_route.freezed.dart';
part 'trip_route.g.dart';

@freezed
class TripRoute with _$TripRoute {
  const factory TripRoute({
    required String id,
    required String busRouteId,
    required String routeNumber,
    required RouteDirection direction,
    required BusStop origin,
    required List<BusStop> stops,
    required BusStop destination,
  }) = _TripRoute;

  factory TripRoute.fromJson(Map<String, dynamic> json) =>
      _$TripRouteFromJson(json);

  factory TripRoute.empty() {
    const uuid = Uuid();
    return TripRoute(
      id: uuid.v4(),
      busRouteId: '',
      routeNumber: '',
      direction: RouteDirection.forward,
      origin: BusStop.empty(),
      destination: BusStop.empty(),
      stops: <BusStop>[],
    );
  }
}
