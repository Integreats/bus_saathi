// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusImpl _$$BusImplFromJson(Map<String, dynamic> json) => _$BusImpl(
      id: json['id'] as String,
      routeNumber: json['routeNumber'] as String,
      licensePlateNumber: json['licensePlateNumber'] as String,
      energySource: $enumDecode(_$EnergySourceEnumMap, json['energySource']),
      capacity: json['capacity'] as int,
      model: json['model'] as String,
      imageUrl: json['imageUrl'] as String?,
      createdAt: const DateTimeJsonConverter()
          .fromJson(json['createdAt'] as Timestamp),
      updatedAt: const DateTimeJsonConverter()
          .fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$BusImplToJson(_$BusImpl instance) => <String, dynamic>{
      'id': instance.id,
      'routeNumber': instance.routeNumber,
      'licensePlateNumber': instance.licensePlateNumber,
      'energySource': _$EnergySourceEnumMap[instance.energySource]!,
      'capacity': instance.capacity,
      'model': instance.model,
      'imageUrl': instance.imageUrl,
      'createdAt': const DateTimeJsonConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeJsonConverter().toJson(instance.updatedAt),
    };

const _$EnergySourceEnumMap = {
  EnergySource.electricity: 'electricity',
  EnergySource.petrol: 'petrol',
  EnergySource.diesel: 'diesel',
  EnergySource.hydrogen: 'hydrogen',
  EnergySource.hybrid: 'hybrid',
};

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
