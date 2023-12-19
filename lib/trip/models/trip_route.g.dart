// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'trip_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripRouteImpl _$$TripRouteImplFromJson(Map<String, dynamic> json) =>
    _$TripRouteImpl(
      id: json['id'] as String,
      busRouteId: json['busRouteId'] as String,
      routeNumber: json['routeNumber'] as String,
      direction: $enumDecode(_$RouteDirectionEnumMap, json['direction']),
      origin: BusStop.fromJson(json['origin'] as Map<String, dynamic>),
      stops: (json['stops'] as List<dynamic>)
          .map((e) => BusStop.fromJson(e as Map<String, dynamic>))
          .toList(),
      destination:
          BusStop.fromJson(json['destination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TripRouteImplToJson(_$TripRouteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'busRouteId': instance.busRouteId,
      'routeNumber': instance.routeNumber,
      'direction': _$RouteDirectionEnumMap[instance.direction]!,
      'origin': instance.origin.toJson(),
      'stops': instance.stops.map((e) => e.toJson()).toList(),
      'destination': instance.destination.toJson(),
    };

const _$RouteDirectionEnumMap = {
  RouteDirection.forward: 'forward',
  RouteDirection.reverse: 'reverse',
};

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
