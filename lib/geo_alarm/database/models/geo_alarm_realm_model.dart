import 'package:realm/realm.dart';

part 'geo_alarm_realm_model.g.dart';

@RealmModel()
class _GeoAlarmRealmModel {
  @PrimaryKey()
  late String id;

  late String label;
  late _CoordinatesRealmModel? coordinates;
  late double radius;
  late String triggerOn;
  late bool isActive = false;
}

@RealmModel()
class _CoordinatesRealmModel {
  late double latitude;
  late double longitude;
}
