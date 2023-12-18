import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';

import '../../../app_permissions/providers/app_permissions_controller.dart';
import '../../../l10n/locale.dart';
import 'app_permissions_card.dart';

class BatteryOptimazationStateCard extends StatefulHookConsumerWidget {
  const BatteryOptimazationStateCard({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<BatteryOptimazationStateCard> createState() =>
      _BatteryOptimazationStateCardState();
}

class _BatteryOptimazationStateCardState
    extends ConsumerState<BatteryOptimazationStateCard>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      checkBatteryOptimizationState();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isBatteryOptimzationDisabled = ref.watch(
        appPermissionsControllerProvider
            .select((value) => value.value!.isBatteryOptimizationDisabled));

    return AppPermissionsCard(
      onTap: () async {
        await ref
            .read(appPermissionsControllerProvider.notifier)
            .requestDisableBatteryOptimization();
        await checkBatteryOptimizationState();
      },
      state: isBatteryOptimzationDisabled,
      icon: UniconsLine.battery_bolt,
      label: $strings.batteryOptimization,
    );
  }

  Future<void> checkBatteryOptimizationState() async {
    await ref
        .read(appPermissionsControllerProvider.notifier)
        .isBatteryOptimizationDisabled();
  }
}
