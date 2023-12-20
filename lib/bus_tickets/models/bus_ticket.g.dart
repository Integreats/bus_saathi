// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'bus_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusTicketImpl _$$BusTicketImplFromJson(Map<String, dynamic> json) =>
    _$BusTicketImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      origin: BusStop.fromJson(json['origin'] as Map<String, dynamic>),
      destination:
          BusStop.fromJson(json['destination'] as Map<String, dynamic>),
      ticketAmount: (json['ticketAmount'] as num).toDouble(),
      paymentId: json['paymentId'] as String,
      isCheckedIn: json['isCheckedIn'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$BusTicketImplToJson(_$BusTicketImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'origin': instance.origin.toJson(),
      'destination': instance.destination.toJson(),
      'ticketAmount': instance.ticketAmount,
      'paymentId': instance.paymentId,
      'isCheckedIn': instance.isCheckedIn,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
