// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conductor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConductorImpl _$$ConductorImplFromJson(Map<String, dynamic> json) =>
    _$ConductorImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as int,
      busDetails:
          BusDetails.fromJson(json['busDetails'] as Map<String, dynamic>),
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
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'busDetails': instance.busDetails,
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
