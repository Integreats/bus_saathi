import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../authentication/screens/sign_in_screen.dart';
import '../authentication/screens/sign_up_screen.dart';
// import '../bottom_navigation_screen.dart';
import '../bus_review/screens/bus_review_screen.dart';
import '../models/app_user.dart';
import '../onboarding/onboarding_screen.dart';
import '../providers/app_user_provider.dart';
import '../trackbus/track_bus_screen.dart';

class ScreenPaths {
  static String homeScreen = '/homeScreen';
  static String trackForm = 'trackForm';
  static String trackBus = 'trackBus';
}

/// Caches and Exposes a [GoRouter]
final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true, // For demo purposes
    refreshListenable: router, // This notifiies `GoRouter` for refresh events
    redirect: router._redirectLogic, // All the logic is centralized here
    routes: router._routes, // All the routes can be found there
  );
});

/// My favorite approach: ofc there's room for improvement, but it works fine.
/// What I like about this is that `RouterNotifier` centralizes all the logic.
/// The reason we use `ChangeNotifier` is because it's a `Listenable` object,
/// as required by `GoRouter`'s `refreshListenable` parameter.
/// Unluckily, it is not possible to use a `StateNotifier` here, since it's
/// not a `Listenable`. Recall that `StateNotifier` is to be preferred over
/// `ChangeNotifier`, see https://riverpod.dev/docs/concepts/providers/#different-types-of-providers
/// There are other approaches to solve this, and they can
/// be found in the `/others` folder.
class RouterNotifier extends ChangeNotifier {
  final Ref ref;

  /// This implementation exploits `ref.listen()` to add a simple callback that
  /// calls `notifyListeners()` whenever there's change onto a desider provider.
  RouterNotifier(this.ref) {
    // _ref.listen<User?>(
    //   userProvider, // In our case, we're interested in the log in / log out events.
    //   (_, __) => notifyListeners(), // Obviously more logic can be added here
    // );
  }

  /// IMPORTANT: conceptually, we want to use `ref.read` to read providers, here.
  /// GoRouter is already aware of state changes through `refreshListenable`
  /// We don't want to trigger a rebuild of the surrounding provider.
  String? _redirectLogic(BuildContext context, GoRouterState state) {
    AppUser? user = ref.watch(appUserProvider);
    final areWeLoggingIn =
        state.uri.toString() == '/' || state.uri.toString().contains('/verify');
    if (user == null) {
      return areWeLoggingIn ? null : '/';
    }
    if (areWeLoggingIn) {
      return ScreenPaths.homeScreen;
    }
    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: '/onboarding',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: rightToLeftFadeTransition,
              child: const OnboardingScreen(),
            );
          },
          routes: [
            GoRoute(
              path: 'signin',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  transitionsBuilder: rightToLeftFadeTransition,
                  child: const SignInScreen(),
                );
              },
            ),
            GoRoute(
              path: 'signup',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  transitionsBuilder: rightToLeftFadeTransition,
                  child: const SignUpScreen(),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: ScreenPaths.homeScreen,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: rightToLeftFadeTransition,
              child: const BusReviewScreen(),
            );
          },
          routes: [
            GoRoute(
              path: ScreenPaths.trackBus,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: const TrackBusScreen(),
                  transitionsBuilder: rightToLeftFadeTransition,
                );
              },
            )
          ],
        ),
      ];
}

Widget rightToLeftFadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(animation),
    child: FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    ),
  );
}
