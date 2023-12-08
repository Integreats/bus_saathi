// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripRouteImpl _$$TripRouteImplFromJson(Map<String, dynamic> json) =>
    _$TripRouteImpl(
      id: json['id'] as String,
      origin: BusStop.fromJson(json['origin'] as Map<String, dynamic>),
      destination:
          BusStop.fromJson(json['destination'] as Map<String, dynamic>),
      stops: (json['stops'] as List<dynamic>)
          .map((e) => BusStop.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TripRouteImplToJson(_$TripRouteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'origin': instance.origin,
      'destination': instance.destination,
      'stops': instance.stops,
    };
