import 'dart:async';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_user/providers/app_user_controller_provider.dart';
import 'authentication/providers/authentication_controller_provider.dart';
import 'firebase_options.dart';
import 'l10n/locale.dart';
import 'providers/app_user_preferences_provider.dart';
import 'providers/firebase_providers/firebase_app_provider.dart';
import 'router/router.dart';
import 'services/app_initializer_service.dart';
import 'themes/dark_theme.dart';
import 'themes/light_theme.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAppCheck.instanceFor(app: app).activate(
      androidProvider: AndroidProvider.debug,
    );
    final appInitializer = AppInitializer.instance;
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    GetIt.I.registerLazySingleton<LocaleLogic>(() => LocaleLogic());
    await appInitializer.initialize();

    final container = ProviderContainer();
    container.read(firebaseAppProvider.notifier).state = app;
    try {
      await container.read(authenticationControllerProvider.future);
      await container.read(appUserControllerProvider.future);
      await container.read(appUserPreferencesProvider.future);
    } finally {}

    return runApp(
      ProviderScope(
        parent: container,
        child: const MyBusSaathiApp(),
      ),
    );
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  });
}

class MyBusSaathiApp extends ConsumerWidget {
  const MyBusSaathiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final locale = ref.watch(
        appUserPreferencesProvider.select((value) => value.value?.locale));
    final theme = ref.watch(
        appUserPreferencesProvider.select((value) => value.value!.themeMode));

    return MaterialApp.router(
      title: 'Bus Saathi',
      themeMode: theme,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'IN'), // English, no country code
        Locale('kn', 'IN'), // Kannada, no country code
      ],
      theme: lightTheme(),
      darkTheme: darkTheme(),
    );
  }
}
