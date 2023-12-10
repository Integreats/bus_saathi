import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../json_converters/date_time_json_converter.dart';

part 'bus_details.freezed.dart';
part 'bus_details.g.dart';

@freezed
class BusDetails with _$BusDetails {
  const factory BusDetails({
    required String id,
    required String numberPlateNumber,
    required String busIdentifier,
    @DateTimeJsonConverter() required DateTime createdAt,
    @DateTimeJsonConverter() required DateTime updatedAt,
  }) = _BusDetails;

  factory BusDetails.fromJson(Map<String, dynamic> json) =>
      _$BusDetailsFromJson(json);

  factory BusDetails.empty() {
    const uuid = Uuid();
    return BusDetails(
      id: uuid.v4(),
      numberPlateNumber: '',
      busIdentifier: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
