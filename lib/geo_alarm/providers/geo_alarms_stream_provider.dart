import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/geo_alarm.dart';
import '../repositories/geo_alarm_repository.dart';

/// Provides all alarms that has been created irrespective of their status(active or inactive).
final allGeoAlarmsStreamProvider = StreamProvider<List<GeoAlarm>>((ref) async* {
  final alarmRepository = ref.watch(geoAlarmRepositoryProvider);

  final alarmsStream = alarmRepository.streamAlarms();

  await for (final alarms in alarmsStream) {
    yield alarms;
  }
});

/// Provides all active alarms.
final activeGeoAlarmsStreamProvider =
    StreamProvider<List<GeoAlarm>>((ref) async* {
  final alarmRepository = ref.watch(geoAlarmRepositoryProvider);

  final alarmsStream = alarmRepository.streamAlarms();

  await for (final alarms in alarmsStream) {
    yield alarms.where((alarm) => alarm.isActive).toList();
  }
});

/// Provides all inactive alarms.
final inactiveGeoAlarmsStreamProvider =
    StreamProvider<List<GeoAlarm>>((ref) async* {
  final alarmRepository = ref.watch(geoAlarmRepositoryProvider);

  final alarmsStream = alarmRepository.streamAlarms();

  await for (final alarms in alarmsStream) {
    yield alarms.where((alarm) => !alarm.isActive).toList();
  }
});
