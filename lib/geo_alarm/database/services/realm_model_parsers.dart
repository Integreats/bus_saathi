import '../../models/geo_alarm.dart';
import '../models/geo_alarm_realm_model.dart';

class RealmModelParsers {
  static List<GeoAlarm> parseGeoAlarmRealmModelList(
      List<GeoAlarmRealmModel> list) {
    List<GeoAlarm> alarms = [];
    for (int i = 0; i < list.length; i++) {
      alarms.add(
        GeoAlarm.fromRealmModel(list[i]),
      );
    }
    return alarms;
  }
}
