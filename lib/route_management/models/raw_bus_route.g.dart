// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_bus_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RawBusRouteImpl _$$RawBusRouteImplFromJson(Map<String, dynamic> json) =>
    _$RawBusRouteImpl(
      id: json['id'] as String,
      origin: json['origin'] as String,
      destination: json['destination'] as String,
      stops: (json['stops'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: const DateTimeJsonConverter()
          .fromJson(json['createdAt'] as Timestamp),
      updatedAt: const DateTimeJsonConverter()
          .fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$RawBusRouteImplToJson(_$RawBusRouteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'origin': instance.origin,
      'destination': instance.destination,
      'stops': instance.stops,
      'createdAt': const DateTimeJsonConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeJsonConverter().toJson(instance.updatedAt),
    };
