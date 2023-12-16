import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app_permissions/providers/app_permissions_controller.dart';
import '../../../l10n/locale.dart';
import 'app_permissions_card.dart';

class GpsPermissionStateCard extends StatefulHookConsumerWidget {
  const GpsPermissionStateCard({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<GpsPermissionStateCard> createState() =>
      _GpsPermissionStateCardState();
}

class _GpsPermissionStateCardState extends ConsumerState<GpsPermissionStateCard>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    checkLocationPermissions();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      checkLocationPermissions();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isGpsEnabled =
        ref.watch(appPermissionsControllerProvider).value!.isGpsEnabled;

    return AppPermissionsCard(
      onTap: () async {
        await showLocationPermissionDisclosure(context);
      },
      state: isGpsEnabled,
      trueStateIcon: Icons.gps_fixed_rounded,
      falseStateIcon: Icons.gps_off_rounded,
      label: $strings.location,
    );
  }

  Future<void> checkLocationPermissions() async {
    final appPermissionsNotifier =
        ref.read(appPermissionsControllerProvider.notifier);
    await appPermissionsNotifier.isLocationServicesEnabled();
  }

  /// Checks status of Location permissions as well as Service Status.
  Future<void> checkAndRequestLocationPermissions() async {
    final appPermissionsNotifier =
        ref.read(appPermissionsControllerProvider.notifier);
    await appPermissionsNotifier.requestLocationServices();
  }

  Future<void> showLocationPermissionDisclosure(BuildContext context) async {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () async {
        context.pop();
        await checkAndRequestLocationPermissions();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Location Permission Disclosure"),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "We need your location to provide you with the best experience.",
          ),
          SizedBox(height: 20),
          Text(
            "- Your location will be used in background to send realtime location to the users.",
          ),
        ],
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
