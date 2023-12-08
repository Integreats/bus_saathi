// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusRouteImpl _$$BusRouteImplFromJson(Map<String, dynamic> json) =>
    _$BusRouteImpl(
      id: json['id'] as String,
      origin: BusStop.fromJson(json['origin'] as Map<String, dynamic>),
      destination:
          BusStop.fromJson(json['destination'] as Map<String, dynamic>),
      stops: (json['stops'] as List<dynamic>)
          .map((e) => BusStop.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: const DateTimeJsonConverter()
          .fromJson(json['createdAt'] as Timestamp),
      updatedAt: const DateTimeJsonConverter()
          .fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$BusRouteImplToJson(_$BusRouteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'origin': instance.origin,
      'destination': instance.destination,
      'stops': instance.stops,
      'createdAt': const DateTimeJsonConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeJsonConverter().toJson(instance.updatedAt),
    };
