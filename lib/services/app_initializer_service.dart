import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../locale/locale.dart';
import '../models/app_user_preferences.dart';
import '../providers/app_user_preferences_provider.dart';
import '../widgets/google_maps_marker.dart';

class AppInitializer {
  AppInitializer._private();

  static AppInitializer instance = AppInitializer._private();

  /// Overrides for initializing Riverpod Providers
  List<Override> riverpodOverrides = [];

  Future<void> initialize() async {
    // =========DO NOT CHANGE THE ORDER ===========

    await Hive.initFlutter();
    GetIt.I.registerLazySingleton<LocaleLogic>(() => LocaleLogic());
    // =============================================
    await MapMarker.init();
    await configureSystem();
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

    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.debug,
    );

    await Hive.openBox('app_user_preferences').then(
      (value) async {
        Locale locale = Locale.fromSubtags(
          languageCode: value.get('locale', defaultValue: 'en'),
        );
        await localeLogic.load(locale);
        riverpodOverrides.add(
          appUserPreferencesProvider.overrideWith(
            (ref) {
              return AppUserPreferencesProvider(
                const AppUserPreferences(
                  locale: Locale('en'),
                  isFingerprintLockEnabled: false,
                  themeMode: ThemeMode.system,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
