import 'dart:async';

import 'package:alarm/alarm.dart' as alarm_plugin;
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/location_stream_provider.dart';
import '../models/geo_alarm.dart';
import '../providers/geo_alarms_stream_provider.dart';
import '../repositories/geo_alarm_repository.dart';

final locationAlarmControllerProvider =
    AsyncNotifierProvider<LocationAlarmNotifier, void>(
        LocationAlarmNotifier.new);

final runningGeoAlarmProvider = StateProvider<GeoAlarm?>((ref) {
  return null;
});

final class LocationAlarmNotifier extends AsyncNotifier<void> {
  GeoAlarmRepository get _geoAlarmRepository =>
      ref.read(geoAlarmRepositoryProvider);

  late ProviderSubscription<AsyncValue<Position>> _locationStreamSubscription;

  @override
  Future<void> build() async {
    _locationStreamSubscription = ref.listen<AsyncValue<Position>>(
      locationStreamProvider,
      (previous, next) {
        next.whenData((position) async {
          final readyToTriggerAlarms = checkUserInRegionAlarms(next.value!);

          if (readyToTriggerAlarms.isNotEmpty) {
            await triggerAlarm(readyToTriggerAlarms.first);
          }
        });
      },
      onError: (error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace, label: error.toString());
      },
      fireImmediately: true,
    );
    return;
  }

  List<GeoAlarm> checkUserInRegionAlarms(Position position) {
    final activeAlarms = ref.read(activeGeoAlarmsStreamProvider).value ?? [];
    final locationReachedAlarms = activeAlarms.where((element) {
      final distance = Geolocator.distanceBetween(
        element.coordinates.latitude,
        element.coordinates.longitude,
        position.latitude,
        position.longitude,
      );
      return distance <= element.radius;
    });

    return locationReachedAlarms.toList();
  }

  /// This method is called when the user gets into the specified area radius of the alarm.
  Future<void> triggerAlarm(GeoAlarm alarm) async {
    if (alarm_plugin.Alarm.hasAlarm()) {
      return;
    }

    final alarmSettings = alarm_plugin.AlarmSettings(
      id: 0,
      dateTime: DateTime.now().add(const Duration(seconds: 2)),
      assetAudioPath: 'assets/morning_alarm.mp3',
      loopAudio: true,
      vibrate: true,
      fadeDuration: 3.0,
      notificationTitle: alarm.label,
      notificationBody: 'You have reached your location',
      enableNotificationOnKill: true,
    );
    final isAlarmSet = await alarm_plugin.Alarm.set(
      alarmSettings: alarmSettings,
    );

    if (isAlarmSet) {
      ref.read(runningGeoAlarmProvider.notifier).state = alarm;
      try {
        AndroidAlarmManager.oneShot(
          const Duration(seconds: 2),
          1,
          LocationAlarmNotifier.launchApp,
          alarmClock: true,
          exact: true,
          wakeup: true,
          rescheduleOnReboot: true,
        );
      } catch (e, stack) {
        debugPrintStack(stackTrace: stack, label: e.toString());
      }
    }
  }

  Future<void> stopAlarm(GeoAlarm alarm) async {
    if (alarm_plugin.Alarm.hasAlarm()) {
      await alarm_plugin.Alarm.stop(0);
      await AndroidAlarmManager.cancel(1);
      await _geoAlarmRepository.toggleAlarm(alarm, false);
      ref.read(runningGeoAlarmProvider.notifier).state = null;
    }
  }

  closeLocationStream() {
    _locationStreamSubscription.close();
  }

  static launchApp() {
    FlutterForegroundTask.launchApp();
  }
}
