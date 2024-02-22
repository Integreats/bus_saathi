import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../bus_stops/models/bus_stop.dart';

part 'bus_stop_alert.freezed.dart';
part 'bus_stop_alert.g.dart';

@freezed
class BusStopAlert with _$BusStopAlert {
  factory BusStopAlert({
    required String id,
    required String userId,
    required String? fcmToken,
    required String tripId,
    required String routeNumber,
    required BusStop busStop,
    required bool isTriggered,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BusStopAlert;

  factory BusStopAlert.fromJson(Map<String, dynamic> json) =>
      _$BusStopAlertFromJson(json);

  factory BusStopAlert.empty() {
    const uuid = Uuid();
    return BusStopAlert(
      id: uuid.v4(),
      userId: '',
      tripId: '',
      fcmToken: null,
      routeNumber: '',
      busStop: BusStop.empty(),
      isTriggered: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
