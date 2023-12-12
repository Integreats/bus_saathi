import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../user_management/models/gender.dart';
import '../json_converters/date_time_json_converter.dart';

part 'conductor.freezed.dart';
part 'conductor.g.dart';

@freezed
class Conductor with _$Conductor {
  const factory Conductor({
    required String id,
    required String busId,
    required String name,
    required int phoneNumber,
    required String? profilePicture,
    required Gender gender,
    @DateTimeJsonConverter() required DateTime createdAt,
    @DateTimeJsonConverter() required DateTime updatedAt,
  }) = _Conductor;

  factory Conductor.fromJson(Map<String, dynamic> json) =>
      _$ConductorFromJson(json);

  factory Conductor.empty() {
    const uuid = Uuid();
    return Conductor(
      id: uuid.v4(),
      name: '',
      phoneNumber: 0,
      profilePicture: null,
      busId: '',
      gender: Gender.male,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
