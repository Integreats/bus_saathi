import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_permissions/providers/app_permissions_controller.dart';
import 'dashboard/screens/dashboard_screen.dart';
import 'l10n/locale.dart';
import 'more/screens/more_screen.dart';
import 'providers/location_stream_provider.dart';
import 'trip_planner/screens/trip_planner_screen.dart';
import 'widgets/keep_alive_page.dart';
import 'widgets/navigation/bottom_nav_bar.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({
    super.key,
  });

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  late PageController pageController;
  late ValueNotifier<int> currentIndex;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
    );
    currentIndex = ValueNotifier(0);
  }

  final List<Widget> destinations = const [
    KeepAlivePage(child: DashboardScreen()),
    KeepAlivePage(child: TripPlannerScreen()),
    KeepAlivePage(child: MoreScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return _EagerInitialize(
      child: Scaffold(
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: currentIndex,
          builder: (context, value, _) {
            return BottomNavBar(
              selectedIndex: value,
              destinations: [
                BottomNavBarDestination(
                  icon: const Icon(Icons.dashboard_rounded),
                  label: $strings.dashboard,
                ),
                BottomNavBarDestination(
                  icon: const Icon(Icons.route_outlined),
                  label: $strings.tripPlanner,
                ),
                BottomNavBarDestination(
                  icon: const Icon(Icons.more_horiz_rounded),
                  label: $strings.more,
                ),
              ],
              onDestinationSelected: (value) {
                currentIndex.value = value;
                pageController.animateToPage(
                  value,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              iconColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return Theme.of(context).colorScheme.primary;
                }
                return Colors.white;
              }),
            );
          },
        ),
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: destinations,
        ),
      ),
    );
  }
}

class _EagerInitialize extends ConsumerWidget {
  const _EagerInitialize({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(appPermissionsControllerProvider);
    ref.watch(locationStreamProvider);
    return child;
  }
}
