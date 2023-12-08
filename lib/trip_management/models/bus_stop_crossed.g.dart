// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_stop_crossed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusStopCrossedImpl _$$BusStopCrossedImplFromJson(Map<String, dynamic> json) =>
    _$BusStopCrossedImpl(
      busStop: BusStop.fromJson(json['busStop'] as Map<String, dynamic>),
      crossedDateTime: const DateTimeJsonConverter()
          .fromJson(json['crossedDateTime'] as Timestamp),
    );

Map<String, dynamic> _$$BusStopCrossedImplToJson(
        _$BusStopCrossedImpl instance) =>
    <String, dynamic>{
      'busStop': instance.busStop,
      'crossedDateTime':
          const DateTimeJsonConverter().toJson(instance.crossedDateTime),
    };
