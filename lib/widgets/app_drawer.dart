import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../l10n/locale.dart';
import 'tile_layout.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      elevation: 12.0,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: DrawerHeader(
              child: Lottie.asset("images/lottie/bus_lottie.json"),
            ),
            automaticallyImplyLeading: false,
            actions: const [
              SizedBox.shrink(),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                TileLayout(
                  onTap: () {
                    Navigator.of(context).pop();
                    GoRouter.of(context).go('/');
                  },
                  listTile: ListTile(
                    title: Text(
                      $strings.trackAnotherTrip,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    dense: true,
                  ),
                ),
                TileLayout(
                  onTap: () {
                    Navigator.of(context).pop();
                    GoRouter.of(context).go('/trackBus');
                  },
                  listTile: ListTile(
                    title: Text(
                      $strings.returnToMap,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    trailing: const Icon(Icons.chevron_right_rounded),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
