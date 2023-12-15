// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveLocationImpl _$$LiveLocationImplFromJson(Map<String, dynamic> json) =>
    _$LiveLocationImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      geohash: json['geohash'] as String,
      accuracy: (json['accuracy'] as num).toDouble(),
      heading: (json['heading'] as num).toDouble(),
      altitude: (json['altitude'] as num).toDouble(),
      speed: (json['speed'] as num).toDouble(),
      speedAccuracy: (json['speedAccuracy'] as num).toDouble(),
      timestamp: const DateTimeJsonConverter()
          .fromJson(json['timestamp'] as Timestamp),
    );

Map<String, dynamic> _$$LiveLocationImplToJson(_$LiveLocationImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'geohash': instance.geohash,
      'accuracy': instance.accuracy,
      'heading': instance.heading,
      'altitude': instance.altitude,
      'speed': instance.speed,
      'speedAccuracy': instance.speedAccuracy,
      'timestamp': const DateTimeJsonConverter().toJson(instance.timestamp),
    };

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
