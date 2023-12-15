import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/geo_alarm.dart';
import '../repositories/geo_alarm_repository.dart';

final geoAlarmsControllerProvider =
    AsyncNotifierProvider<GeoAlarmsNotifier, void>(GeoAlarmsNotifier.new);

final class GeoAlarmsNotifier extends AsyncNotifier<void> {
  GeoAlarmRepository get _geoAlarmRepository =>
      ref.read(geoAlarmRepositoryProvider);

  @override
  Future<void> build() async {
    return;
  }

  Future<void> saveAlarm(GeoAlarm alarm) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _geoAlarmRepository.addAlarm(alarm);
    });
  }

  Future<void> updateAlarm(GeoAlarm alarm) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _geoAlarmRepository.updateAlarm(alarm);
    });
  }

  Future<void> deleteAlarm(GeoAlarm alarm) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _geoAlarmRepository.deleteAlarm(alarm);
    });
  }

  Future<void> activateAlarm(GeoAlarm alarm) async {
    await _toggleAlarm(alarm, true);
  }

  Future<void> deactivateAlarm(GeoAlarm alarm) async {
    await _toggleAlarm(alarm, false);
  }

  Future<void> _toggleAlarm(GeoAlarm alarm, bool isActive) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _geoAlarmRepository.toggleAlarm(alarm, isActive);
    });
  }
}
