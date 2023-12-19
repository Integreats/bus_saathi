// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'raw_bus_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RawBusRouteImpl _$$RawBusRouteImplFromJson(Map<String, dynamic> json) =>
    _$RawBusRouteImpl(
      id: json['id'] as String,
      routeNumber: json['routeNumber'] as String,
      direction: $enumDecode(_$RouteDirectionEnumMap, json['direction']),
      origin: json['origin'] as String,
      stops: (json['stops'] as List<dynamic>).map((e) => e as String).toList(),
      destination: json['destination'] as String,
      createdAt: const DateTimeJsonConverter()
          .fromJson(json['createdAt'] as Timestamp),
      updatedAt: const DateTimeJsonConverter()
          .fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$RawBusRouteImplToJson(_$RawBusRouteImpl instance) =>
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

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
