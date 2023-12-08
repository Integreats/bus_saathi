import 'package:bus_saathi/locale/locale.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/app_user_preferences.dart';

final appUserPreferencesProvider =
    StateNotifierProvider<AppUserPreferencesProvider, AppUserPreferences>(
        (ref) {
  return AppUserPreferencesProvider(const AppUserPreferences(
    locale: Locale('en'),
    isFingerprintLockEnabled: false,
    themeMode: ThemeMode.system,
  ));
});

class AppUserPreferencesProvider extends StateNotifier<AppUserPreferences> {
  AppUserPreferencesProvider(AppUserPreferences appUserPreferences)
      : super(appUserPreferences);

  Future<void> updateLocale(Locale locale) async {
    state = state.copyWith(locale: locale);
    await localeLogic.loadIfChanged(locale);
    await Hive.openBox('app_user_preferences').then(
      (value) async => await value.put('locale', locale.toLanguageTag()),
    );
  }

  Future<void> updateThemeMode(ThemeMode mode) async {
    state = state.copyWith(themeMode: mode);
    await Hive.openBox('app_user_preferences').then(
      (value) async => await value.put('theme', mode.name),
    );
  }

  Future<void> reset() async {
    state = const AppUserPreferences(
      locale: Locale('en'),
      isFingerprintLockEnabled: false,
      themeMode: ThemeMode.system,
    );
    await Hive.openBox('app_user_preferences').then(
      (value) async {
        await value.put('locale', const Locale('en').toLanguageTag());
      },
    );
  }
}
