// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripImpl _$$TripImplFromJson(Map<String, dynamic> json) => _$TripImpl(
      id: json['id'] as String,
      startDateTime: const DateTimeJsonConverter()
          .fromJson(json['startDateTime'] as Timestamp),
      endDateTime: const DateTimeJsonConverter()
          .fromJson(json['endDateTime'] as Timestamp),
      conductor: Conductor.fromJson(json['conductor'] as Map<String, dynamic>),
      liveLocation: (json['liveLocation'] as List<dynamic>)
          .map((e) => LiveLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      isEnded: json['isEnded'] as bool,
      tripRoute: json['tripRoute'] == null
          ? null
          : TripRoute.fromJson(json['tripRoute'] as Map<String, dynamic>),
      busStopsCrossed: (json['busStopsCrossed'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, BusStopCrossed.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$TripImplToJson(_$TripImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDateTime':
          const DateTimeJsonConverter().toJson(instance.startDateTime),
      'endDateTime': const DateTimeJsonConverter().toJson(instance.endDateTime),
      'conductor': instance.conductor,
      'liveLocation': instance.liveLocation,
      'isEnded': instance.isEnded,
      'tripRoute': instance.tripRoute,
      'busStopsCrossed': instance.busStopsCrossed,
    };
