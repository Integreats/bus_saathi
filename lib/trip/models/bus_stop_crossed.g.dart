// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

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
      'busStop': instance.busStop.toJson(),
      'crossedDateTime':
          const DateTimeJsonConverter().toJson(instance.crossedDateTime),
    };

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
