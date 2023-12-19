// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'conductor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConductorImpl _$$ConductorImplFromJson(Map<String, dynamic> json) =>
    _$ConductorImpl(
      id: json['id'] as String,
      busId: json['busId'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as int,
      profilePicture: json['profilePicture'] as String?,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      createdAt: const DateTimeJsonConverter()
          .fromJson(json['createdAt'] as Timestamp),
      updatedAt: const DateTimeJsonConverter()
          .fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$ConductorImplToJson(_$ConductorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'busId': instance.busId,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'profilePicture': instance.profilePicture,
      'gender': _$GenderEnumMap[instance.gender]!,
      'createdAt': const DateTimeJsonConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeJsonConverter().toJson(instance.updatedAt),
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.others: 'others',
};

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
