import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app_permissions/providers/app_permissions_controller.dart';
import '../../../l10n/locale.dart';
import 'app_permissions_card.dart';


class AppNotificationsPermissionStateCard extends StatefulHookConsumerWidget {
  const AppNotificationsPermissionStateCard({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<AppNotificationsPermissionStateCard> createState() =>
      _AppNotificationsPermissionStateCardState();
}

class _AppNotificationsPermissionStateCardState
    extends ConsumerState<AppNotificationsPermissionStateCard>
    with WidgetsBindingObserver {
  late final AppPermissionsController appPermissionsNotifier;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    appPermissionsNotifier =
        ref.read(appPermissionsControllerProvider.notifier);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      checkNotificationPermissions();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isAppNotificationsAllowed = ref.watch(appPermissionsControllerProvider
        .select((value) => value.isAppNotificationsAllowed));
    return AppPermissionsCard(
      onTap: () async {
        await appPermissionsNotifier.requestNotificationService();
        await checkNotificationPermissions();
      },
      state: isAppNotificationsAllowed,
      trueStateIcon: CarbonIcons.notification,
      falseStateIcon: CarbonIcons.notification_off,
      label: $strings.notification,
    );
  }

  Future<void> checkNotificationPermissions() async {
    appPermissionsNotifier.isNotificationServiceEnabled();
  }
}
