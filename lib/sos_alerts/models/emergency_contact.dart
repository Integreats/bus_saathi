import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../json_converters/date_time_json_converter.dart';

part 'emergency_contact.freezed.dart';
part 'emergency_contact.g.dart';

@freezed
class EmergencyContact with _$EmergencyContact {
  factory EmergencyContact({
    required String id,
    required String userId,
    required String name,
    required int phoneNumber,
    required String emailAddress,
    @DateTimeJsonConverter() required DateTime createdAt,
    @DateTimeJsonConverter() required DateTime updatedAt,
  }) = _EmergencyContact;

  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactFromJson(json);

  factory EmergencyContact.empty() {
    const uuid = Uuid();
    return EmergencyContact(
      id: uuid.v4(),
      userId: '',
      name: '',
      phoneNumber: 0,
      emailAddress: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
