import 'dart:async';

import 'package:bus_saathi/services/app_initializer_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_user/providers/app_user_controller_provider.dart';
import 'authentication/providers/authentication_controller_provider.dart';
import 'firebase_options.dart';
import 'locale/locale.dart';
import 'providers/app_user_preferences_provider.dart';
import 'providers/firebase_providers/firebase_app_provider.dart';
import 'router/router.dart';
import 'themes/dark_theme.dart';
import 'themes/light_theme.dart';
// import 'sos.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SOSManager {
  AccelerometerEvent? _accelerometerValues;
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;

  void initializeAccelerometer() {
    _accelerometerSubscription = accelerometerEvents.listen(
      (AccelerometerEvent event) {
        _accelerometerValues = event;

        if (_isShaking(event)) {
          _generateSOS();
        }
      },
    );
  }

  bool _isShaking(AccelerometerEvent event) {
    const double shakeThreshold = 12.0;
    return (event.x.abs() > shakeThreshold ||
        event.y.abs() > shakeThreshold ||
        event.z.abs() > shakeThreshold);
  }

  void _generateSOS() {
    // Implement the logic to send an SOS signal
    // For example, you can show a dialog, send an alert, or perform any other action
    print('SOS generated!');
  }

  void stopAccelerometer() {
    _accelerometerSubscription?.cancel();
  }
}

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
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

    // Initialize SOSManager
    final sosManager = SOSManager();
    sosManager.initializeAccelerometer();

    return runApp(
      ProviderScope(
        parent: container,
        child: MyBusSaathiApp(sosManager: sosManager),
      ),
    );
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  });
}

class MyBusSaathiApp extends ConsumerWidget {
  // const MyBusSaathiApp(this.sosManager, {Key? key}) : super(key: key);
  const MyBusSaathiApp({Key? key, required this.sosManager}) : super(key: key);

  final SOSManager sosManager;

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
