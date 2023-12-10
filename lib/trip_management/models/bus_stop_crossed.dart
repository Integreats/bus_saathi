import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../bus_stops/models/bus_stop.dart';
import '../json_converters/date_time_json_converter.dart';

part 'bus_stop_crossed.freezed.dart';
part 'bus_stop_crossed.g.dart';

@freezed
class BusStopCrossed with _$BusStopCrossed {
  const factory BusStopCrossed({
    required BusStop busStop,
    @DateTimeJsonConverter() required DateTime crossedDateTime,
  }) = _BusStopCrossed;

  factory BusStopCrossed.fromJson(Map<String, dynamic> json) =>
      _$BusStopCrossedFromJson(json);

  factory BusStopCrossed.empty() {
    return BusStopCrossed(
      busStop: BusStop.empty(),
      crossedDateTime: DateTime.now(),
    );
  }
}
