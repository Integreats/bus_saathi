import 'package:alarm/alarm.dart' as alarm;
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';

import '../widgets/map/map_markers.dart';

class AppInitializer {
  AppInitializer._private();

  static AppInitializer instance = AppInitializer._private();

  Future<void> initialize() async {
    // =========DO NOT CHANGE THE ORDER ===========

    await Hive.initFlutter();
    // =============================================
    await MapMarkers.init();
    await configureSystem();
    await alarm.Alarm.init();
    await AndroidAlarmManager.initialize();
  }

  Future<void> configureSystem() async {
    // final GoogleMapsFlutterPlatform mapsImplementation =
    //     GoogleMapsFlutterPlatform.instance;
    // if (mapsImplementation is GoogleMapsFlutterAndroid) {
    //   mapsImplementation.useAndroidViewSurface = true;
    // }
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    
  }
}
