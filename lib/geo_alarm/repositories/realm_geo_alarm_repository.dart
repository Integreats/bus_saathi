import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';

import '../database/models/geo_alarm_realm_model.dart';
import '../database/services/realm_model_parsers.dart';
import '../models/geo_alarm.dart';
import 'geo_alarm_repository.dart';

class RealmGeoAlarmRepository extends GeoAlarmRepository {
  late final Realm realm;

  RealmGeoAlarmRepository() {
    final config = Configuration.local(
      [GeoAlarmRealmModel.schema, CoordinatesRealmModel.schema],
      schemaVersion: 1,
    );

    realm = Realm(config);
  }

  @override
  Future<void> addAlarm(GeoAlarm alarm) async {
    await realm.writeAsync<GeoAlarmRealmModel>(() {
      return realm.add<GeoAlarmRealmModel>(alarm.toRealmModel());
    });
  }

  Stream<RealmResultsChanges<GeoAlarmRealmModel>> getAlarms() {
    return realm.all<GeoAlarmRealmModel>().changes;
  }

  @override
  Future<List<GeoAlarm>> fetchAllAlarms() async {
    final alarmsAsRealmModel = realm.all<GeoAlarmRealmModel>().toList();

    final alarms = await compute(
        RealmModelParsers.parseGeoAlarmRealmModelList, alarmsAsRealmModel);
    return alarms;
  }

  @override
  Stream<List<GeoAlarm>> streamAlarms() async* {
    final alarmsAsRealmModelStream = realm.all<GeoAlarmRealmModel>().changes;
    await for (final event in alarmsAsRealmModelStream) {
      final realmAlarms = event.results.toList();
      yield RealmModelParsers.parseGeoAlarmRealmModelList(realmAlarms);
    }
  }

  @override
  Future<List<GeoAlarm>> fetchAlarms(
      {required int startIndex, required int endIndex}) async {
    final alarms = realm.all<GeoAlarmRealmModel>();
    final size = alarms.length;
    // All items fetched condition
    if (startIndex >= size) {
      return [];
    }
    final start = startIndex;
    final end = endIndex > alarms.length ? alarms.length : (endIndex + 1);

    final sublistedRealmAlarms = alarms.toList().sublist(start, end);
    final sublistedAlarms = compute(
        RealmModelParsers.parseGeoAlarmRealmModelList, sublistedRealmAlarms);
    return sublistedAlarms;
  }

  @override
  Future<void> toggleAlarm(GeoAlarm alarm, bool isActive) async {
    final realmObjectToToggle = realm.find<GeoAlarmRealmModel>(alarm.id);

    if (realmObjectToToggle != null) {
      await realm.writeAsync(
        () {
          realmObjectToToggle.isActive = isActive;
        },
      );
    }
  }

  @override
  Future<void> deleteAlarm(GeoAlarm alarm) async {
    final realmObjectToDelete = realm.find<GeoAlarmRealmModel>(alarm.id);

    if (realmObjectToDelete != null) {
      await realm.writeAsync(
          () => realm.delete<GeoAlarmRealmModel>(realmObjectToDelete));
    }
  }

  @override
  Future<void> updateAlarm(GeoAlarm alarm) async {
    final realmObjectToToggle = realm.find<GeoAlarmRealmModel>(alarm.id);

    if (realmObjectToToggle != null) {
      await realm.writeAsync(
        () {
          realm.delete<GeoAlarmRealmModel>(realmObjectToToggle);
          realm.add(alarm.toRealmModel());
        },
      );
    }
  }
}
