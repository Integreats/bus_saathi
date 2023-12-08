import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../route_management/models/bus_stop.dart';

part 'trip_route.freezed.dart';
part 'trip_route.g.dart';

@freezed
class TripRoute with _$TripRoute {
  const factory TripRoute({
    required String id,
    required BusStop origin,
    required BusStop destination,
    required List<BusStop> stops,
  }) = _TripRoute;

  factory TripRoute.fromJson(Map<String, dynamic> json) =>
      _$TripRouteFromJson(json);

  factory TripRoute.empty() {
    const uuid = Uuid();
    return TripRoute(
      id: uuid.v4(),
      origin: BusStop.empty(),
      destination: BusStop.empty(),
      stops: <BusStop>[],
    );
  }
}
