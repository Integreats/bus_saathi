import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../database/models/geo_alarm_realm_model.dart';
import 'coordinates.dart';
import 'trigger_on.dart';

part 'geo_alarm.freezed.dart';

@Freezed()
class GeoAlarm with _$GeoAlarm {
  const GeoAlarm._();

  const factory GeoAlarm({
    required String id,
    required String label,
    required Coordinates coordinates,
    required double radius,
    required TriggerOn triggerOn,
    required bool isActive,
  }) = _GeoAlarm;

  factory GeoAlarm.raw() {
    Uuid uuid = const Uuid();
    return GeoAlarm(
      id: uuid.v1(),
      label: '',
      coordinates: Coordinates.raw(),
      radius: 1000,
      triggerOn: TriggerOn.entry,
      isActive: false,
    );
  }
  GeoAlarmRealmModel toRealmModel() {
    return GeoAlarmRealmModel(
      id,
      label,
      radius,
      triggerOn.name,
      coordinates: coordinates.toRealmModel(),
    );
  }

  factory GeoAlarm.fromRealmModel(GeoAlarmRealmModel alarmRealmModel) {
    return GeoAlarm(
      id: alarmRealmModel.id,
      label: alarmRealmModel.label,
      coordinates: Coordinates.fromRealmModel(alarmRealmModel.coordinates!),
      radius: alarmRealmModel.radius,
      triggerOn: TriggerOnExt.fromName(alarmRealmModel.triggerOn),
      isActive: alarmRealmModel.isActive,
    );
  }
}
