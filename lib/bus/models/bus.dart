import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../json_converters/date_time_json_converter.dart';
import 'energy_source.dart';

part 'bus.freezed.dart';
part 'bus.g.dart';

@freezed
class Bus with _$Bus {
  const factory Bus({
    required String id,
    required String routeNumber,
    required String licensePlateNumber,
    required EnergySource energySource,
    required int capacity,
    required String model,
    required String? imageUrl,
    @DateTimeJsonConverter() required DateTime createdAt,
    @DateTimeJsonConverter() required DateTime updatedAt,
  }) = _Bus;

  factory Bus.fromJson(Map<String, dynamic> json) => _$BusFromJson(json);

  factory Bus.empty() {
    const uuid = Uuid();
    return Bus(
      id: uuid.v4(),
      routeNumber: '',
      energySource: EnergySource.electricity,
      licensePlateNumber: '',
      capacity: 0,
      model: '',
      imageUrl: null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
