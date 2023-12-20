import 'package:bus_saathi/trip/screens/trip_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_user/providers/app_user_controller_provider.dart';
import '../authentication/providers/authentication_controller_provider.dart';
import '../authentication/screens/sign_in_screen.dart';
import '../authentication/screens/sign_up_screen.dart';
import '../bottom_navigation_screen.dart';
import '../bus_review/screens/bus_review_screen.dart';
import '../models/form_type.dart';
import '../onboarding/onboarding_screen.dart';
import '../search/screens/search_screen.dart';
import '../sos_alerts/models/emergency_contact.dart';
import '../sos_alerts/screens/emergency_contact_form_screen.dart';
import '../sos_alerts/screens/emergency_contacts_screen.dart';
import '../trip/screens/running_trips_screen.dart';

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
  final Ref _ref;

  /// This implementation exploits `ref.listen()` to add a simple callback that
  /// calls `notifyListeners()` whenever there's change onto a desider provider.
  RouterNotifier(this._ref) {
    _ref.listen(
      authenticationControllerProvider, // In our case, we're interested in the log in / log out events.
      (_, __) => notifyListeners(), // Obviously more logic can be added here
    );
    _ref.listen(
      appUserControllerProvider, // In our case, we're interested in the log in / log out events.
      (_, __) => notifyListeners(), // Obviously more logic can be added here
    );
  }

  /// IMPORTANT: conceptually, we want to use `ref.read` to read providers, here.
  /// GoRouter is already aware of state changes through `refreshListenable`
  /// We don't want to trigger a rebuild of the surrounding provider.
  String? _redirectLogic(BuildContext context, GoRouterState state) {
    final firebaseUser = _ref.read(authenticationControllerProvider).value;

    // From here we can use the state and implement our custom logic
    final areWeLoggingIn = (state.fullPath == '/onboarding/signin' ||
        state.fullPath == '/onboarding/signup' ||
        state.fullPath == '/onboarding');

    if (firebaseUser == null) {
      // We're not logged in
      // So, IF we aren't in the login page, go there.

      return areWeLoggingIn ? null : '/onboarding';
    }
    if (areWeLoggingIn) {
      return '/';
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
          path: '/',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: rightToLeftFadeTransition,
              child: const BottomNavigationScreen(),
            );
          },
          routes: [
            GoRoute(
              path: 'search',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: const SearchScreen(),
                  transitionsBuilder: rightToLeftFadeTransition,
                );
              },
            ),
            GoRoute(
              path: 'trip/:tripId',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: TripScreen(
                    //TODO: WARNING
                    tripId: state.pathParameters['tripId']!,
                  ),
                  transitionsBuilder: rightToLeftFadeTransition,
                );
              },
            ),
            GoRoute(
              path: 'trips/:routeNumber',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: RunningTripsScreen(
                    routeNumber: state.pathParameters['routeNumber']!,
                  ),
                  transitionsBuilder: rightToLeftFadeTransition,
                );
              },
            ),
            GoRoute(
              path: 'busReview',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: const BusReviewScreen(),
                  transitionsBuilder: bottomToUpFadeTransition,
                );
              },
            ),
            GoRoute(
              path: 'emergencyContacts',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: const EmergencyContactsScreen(),
                  transitionsBuilder: bottomToUpFadeTransition,
                );
              },
              routes: [
                GoRoute(
                  path: ':operation/:emerygencyContactId',
                  pageBuilder: (context, state) {
                    return CustomTransitionPage(
                      key: state.pageKey,
                      child: EmergencyContactFormScreen(
                        emergencyContactFormType: FormTypeExt.fromString(
                            state.pathParameters['operation'].toString()),
                        emergencyContact: state.extra == null
                            ? EmergencyContact.empty()
                            : state.extra as EmergencyContact,
                      ),
                      transitionsBuilder: bottomToUpFadeTransition,
                    );
                  },
                ),
              ],
            ),
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

Widget bottomToUpFadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(animation),
    child: FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    ),
  );
}
