import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class LocaleLogic {
  AppLocalizations? _strings;
  AppLocalizations get strings => _strings!;

  bool get isLoaded => _strings != null;

  bool get isEnglish => strings.localeName == 'en';

  Future<void> load([Locale locale = const Locale('en')]) async {
    if (kDebugMode) {
      // Uncomment for testing in chinese
      // locale = Locale('zh');
    }
    if (AppLocalizations.supportedLocales.contains(locale) == false) {
      locale = const Locale('en', "IN");
    }
    _strings = await AppLocalizations.delegate.load(locale);
  }

  Future<void> loadIfChanged(Locale locale) async {
    bool didChange = _strings?.localeName != locale.languageCode;
    if (didChange && AppLocalizations.supportedLocales.contains(locale)) {
      _strings = await AppLocalizations.delegate.load(locale);
    }
  }
}

LocaleLogic get localeLogic => GetIt.I.get<LocaleLogic>();
AppLocalizations get $strings => localeLogic.strings;
