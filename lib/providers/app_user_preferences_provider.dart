import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../l10n/locale.dart';
import '../models/app_user_preferences.dart';
import '../themes/theme_mode_extension.dart';

final appUserPreferencesProvider =
    AsyncNotifierProvider<AppUserPreferencesNotifier, AppUserPreferences>(
        AppUserPreferencesNotifier.new);

class AppUserPreferencesNotifier extends AsyncNotifier<AppUserPreferences> {
  late final Box box;

  final boxName = 'appUserPreferences';

  @override
  Future<AppUserPreferences> build() async {
    final isBoxOpen = Hive.isBoxOpen(boxName);
    if (!isBoxOpen) {
      box = await Hive.openBox(boxName);
    } else {
      box = Hive.box(boxName);
    }

    final locale = Locale.fromSubtags(
      languageCode: box.get('locale', defaultValue: 'en'),
    );
    await localeLogic.load(locale);

    final themeMode = ThemeModeExtension.themeModeFromName(
      box.get('theme', defaultValue: 'light'),
    );

    return AppUserPreferences(
      themeMode: themeMode,
      isFingerprintLockEnabled: false,
      locale: locale,
    );
  }

  Future<void> updateThemeMode(ThemeMode mode) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await box.put('theme', mode.name);

      return state.value!.copyWith(themeMode: mode);
    });
  }

  Future<void> updateFingerprintAuthStatus(bool isEnabled) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await box.put('fpa', isEnabled);
      return state.value!.copyWith(isFingerprintLockEnabled: isEnabled);
    });
  }

  Future<void> updateLocale(Locale locale) async {
    state = await AsyncValue.guard(() async {
      await localeLogic.loadIfChanged(locale);
      await box.put('locale', locale.toLanguageTag());
      return state.value!.copyWith(locale: locale);
    });
  }

  Future<void> reset() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await box.put('theme', ThemeMode.light.name);
      await box.put('fpa', false);
      await box.put('locale', const Locale('en').toLanguageTag());
      return const AppUserPreferences(
        isFingerprintLockEnabled: false,
        themeMode: ThemeMode.light,
        locale: Locale('en'),
      );
    });
  }
}
