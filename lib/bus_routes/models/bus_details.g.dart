// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusDetailsImpl _$$BusDetailsImplFromJson(Map<String, dynamic> json) =>
    _$BusDetailsImpl(
      id: json['id'] as String,
      numberPlateNumber: json['numberPlateNumber'] as String,
      busIdentifier: json['busIdentifier'] as String,
      createdAt: const DateTimeJsonConverter()
          .fromJson(json['createdAt'] as Timestamp),
      updatedAt: const DateTimeJsonConverter()
          .fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$BusDetailsImplToJson(_$BusDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numberPlateNumber': instance.numberPlateNumber,
      'busIdentifier': instance.busIdentifier,
      'createdAt': const DateTimeJsonConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeJsonConverter().toJson(instance.updatedAt),
    };
