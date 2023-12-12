// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusRouteImpl _$$BusRouteImplFromJson(Map<String, dynamic> json) =>
    _$BusRouteImpl(
      id: json['id'] as String,
      routeNumber: json['routeNumber'] as String,
      direction: $enumDecode(_$RouteDirectionEnumMap, json['direction']),
      origin: BusStop.fromJson(json['origin'] as Map<String, dynamic>),
      stops: (json['stops'] as List<dynamic>)
          .map((e) => BusStop.fromJson(e as Map<String, dynamic>))
          .toList(),
      destination:
          BusStop.fromJson(json['destination'] as Map<String, dynamic>),
      createdAt: const DateTimeJsonConverter()
          .fromJson(json['createdAt'] as Timestamp),
      updatedAt: const DateTimeJsonConverter()
          .fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$BusRouteImplToJson(_$BusRouteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'routeNumber': instance.routeNumber,
      'direction': _$RouteDirectionEnumMap[instance.direction]!,
      'origin': instance.origin,
      'stops': instance.stops,
      'destination': instance.destination,
      'createdAt': const DateTimeJsonConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeJsonConverter().toJson(instance.updatedAt),
    };

const _$RouteDirectionEnumMap = {
  RouteDirection.forward: 'forward',
  RouteDirection.reverse: 'reverse',
};
