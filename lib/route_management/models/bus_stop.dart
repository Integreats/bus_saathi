import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../json_converters/date_time_json_converter.dart';

part 'bus_stop.freezed.dart';
part 'bus_stop.g.dart';

@freezed
class BusStop with _$BusStop {
  factory BusStop({
    required String id,
    required String name,
    required double latitude,
    required double longitude,
    @DateTimeJsonConverter() required DateTime createdAt,
    @DateTimeJsonConverter() required DateTime updatedAt,
  }) = _BusStop;

  factory BusStop.fromJson(Map<String, dynamic> json) =>
      _$BusStopFromJson(json);

  factory BusStop.empty() {
    const uuid = Uuid();
    return BusStop(
      id: uuid.v4(),
      name: '',
      latitude: 0,
      longitude: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
