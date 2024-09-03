import 'dart:async';
import 'package:bus_saathi/providers/firebase_providers/firebase_analytics_provider.dart';
import 'package:bus_saathi/providers/firebase_providers/firebase_messaging_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

late FirebaseApp _app;

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  _app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAnalytics.instanceFor(app: _app)
      .setAnalyticsCollectionEnabled(true);
  print("Handling a background message: ${message.mutableContent}");
}

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    _app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebaseMessaging.instance.requestPermission();
    await FirebaseAppCheck.instanceFor(app: _app).activate(
      androidProvider: AndroidProvider.debug,
    );

    final appInitializer = AppInitializer.instance;
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    GetIt.I.registerLazySingleton<LocaleLogic>(() => LocaleLogic());
    await appInitializer.initialize();

    final container = ProviderContainer();
    container.read(firebaseAppProvider.notifier).state = _app;
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

class MyBusSaathiApp extends ConsumerStatefulWidget {
  const MyBusSaathiApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyBusSaathiApp> createState() => _MyBusSaathiAppState();
}

class _MyBusSaathiAppState extends ConsumerState<MyBusSaathiApp> {
  @override
  void initState() {
    super.initState();
    ref.read(firebaseMessagingProvider).getToken().then((value) async {
      if (value == null) return;
      await ref.read(appUserControllerProvider.notifier).updateFcmToken(value);
    });

    ref.read(firebaseAnalyticsProvider).logAppOpen().then((value) {
      print("Logged app open");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
        Locale('te', 'IN'),
      ],
      theme: lightTheme(),
      darkTheme: darkTheme(),
    );
  }
}
