import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/geo_alarm.dart';
import 'realm_geo_alarm_repository.dart';

final geoAlarmRepositoryProvider = Provider<GeoAlarmRepository>((ref) {
  return RealmGeoAlarmRepository();
});

abstract class GeoAlarmRepository {
  Future<List<GeoAlarm>> fetchAllAlarms();

  Future<void> addAlarm(GeoAlarm alarm);

  Future<void> updateAlarm(GeoAlarm alarm);

  Future<List<GeoAlarm>> fetchAlarms(
      {required int startIndex, required int endIndex});

  Stream<List<GeoAlarm>> streamAlarms();

  Future<void> toggleAlarm(GeoAlarm alarm, bool isActive);

  Future<void> deleteAlarm(GeoAlarm alarm);
}
