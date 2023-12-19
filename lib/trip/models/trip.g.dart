// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripImpl _$$TripImplFromJson(Map<String, dynamic> json) => _$TripImpl(
      id: json['id'] as String,
      bus: Bus.fromJson(json['bus'] as Map<String, dynamic>),
      conductor: Conductor.fromJson(json['conductor'] as Map<String, dynamic>),
      distanceCovered: (json['distanceCovered'] as num?)?.toDouble() ?? 0.0,
      carbonEmission: (json['carbonEmission'] as num?)?.toDouble() ?? 0.0,
      startDateTime: const DateTimeJsonConverter()
          .fromJson(json['startDateTime'] as Timestamp),
      endDateTime: const DateTimeJsonConverter()
          .fromJson(json['endDateTime'] as Timestamp),
      liveLocation: (json['liveLocation'] as List<dynamic>)
          .map((e) => LiveLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      isEnded: json['isEnded'] as bool,
      tripRoute: json['tripRoute'] == null
          ? null
          : TripRoute.fromJson(json['tripRoute'] as Map<String, dynamic>),
      upcomingBusStop: json['upcomingBusStop'] == null
          ? null
          : BusStop.fromJson(json['upcomingBusStop'] as Map<String, dynamic>),
      busStopsCrossed: (json['busStopsCrossed'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, BusStopCrossed.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$TripImplToJson(_$TripImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bus': instance.bus.toJson(),
      'conductor': instance.conductor.toJson(),
      'distanceCovered': instance.distanceCovered,
      'carbonEmission': instance.carbonEmission,
      'startDateTime':
          const DateTimeJsonConverter().toJson(instance.startDateTime),
      'endDateTime': const DateTimeJsonConverter().toJson(instance.endDateTime),
      'liveLocation': instance.liveLocation.map((e) => e.toJson()).toList(),
      'isEnded': instance.isEnded,
      'tripRoute': instance.tripRoute?.toJson(),
      'upcomingBusStop': instance.upcomingBusStop?.toJson(),
      'busStopsCrossed':
          instance.busStopsCrossed?.map((k, e) => MapEntry(k, e.toJson())),
    };

// **************************************************************************
// RealmObjectGenerator

// ignore_for_file: type=lint
