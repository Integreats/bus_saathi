// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'bus_review_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusReviewImpl _$$BusReviewImplFromJson(Map<String, dynamic> json) =>
    _$BusReviewImpl(
      id: json['id'] as String,
      vehicleId: json['vehicleId'] as String,
      userId: json['userId'] as String,
      rating: json['rating'] as int,
      review: json['review'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$BusReviewImplToJson(_$BusReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleId': instance.vehicleId,
      'userId': instance.userId,
      'rating': instance.rating,
      'review': instance.review,
      'images': instance.images,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
