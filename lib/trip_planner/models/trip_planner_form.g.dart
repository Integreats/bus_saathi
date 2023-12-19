// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'trip_planner_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripPlannerFormImpl _$$TripPlannerFormImplFromJson(
        Map<String, dynamic> json) =>
    _$TripPlannerFormImpl(
      origin: BusStop.fromJson(json['origin'] as Map<String, dynamic>),
      destination:
          BusStop.fromJson(json['destination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TripPlannerFormImplToJson(
        _$TripPlannerFormImpl instance) =>
    <String, dynamic>{
      'origin': instance.origin.toJson(),
      'destination': instance.destination.toJson(),
    };

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
