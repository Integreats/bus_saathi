// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'bus_stop_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusStopAlertImpl _$$BusStopAlertImplFromJson(Map<String, dynamic> json) =>
    _$BusStopAlertImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      fcmToken: json['fcmToken'] as String?,
      tripId: json['tripId'] as String,
      routeNumber: json['routeNumber'] as String,
      busStop: BusStop.fromJson(json['busStop'] as Map<String, dynamic>),
      isTriggered: json['isTriggered'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$BusStopAlertImplToJson(_$BusStopAlertImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'fcmToken': instance.fcmToken,
      'tripId': instance.tripId,
      'routeNumber': instance.routeNumber,
      'busStop': instance.busStop.toJson(),
      'isTriggered': instance.isTriggered,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
