import 'dart:async';

import 'package:carbon_icons/carbon_icons.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../l10n/locale.dart';
import 'app_permissions_card.dart';

class InternetConnectionStateCard extends StatefulHookConsumerWidget {
  const InternetConnectionStateCard({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<InternetConnectionStateCard> createState() =>
      _InternetConnectionStateCardState();
}

class _InternetConnectionStateCardState
    extends ConsumerState<InternetConnectionStateCard> {
  bool isInternetConnectionActive = false;
  ConnectivityResult connectionStatus = ConnectivityResult.wifi;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  void initState() {
    super.initState();
    connectivity.checkConnectivity().then((value) {
      setState(() {
        connectionStatus = value;
      });
    });
    InternetConnectionChecker().hasConnection.then((value) {
      setState(() {
        isInternetConnectionActive = value;
      });
    });

    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        connectionStatus = result;
      });
    });
  }

  @override
  void dispose() {
    connectivitySubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppPermissionsCard(
      onTap: () {},
      trueStateIcon: CarbonIcons.connection_signal,
      falseStateIcon: CarbonIcons.connection_signal_off,
      label: $strings.internet,
      state: (isInternetConnectionActive &&
          connectionStatus != ConnectivityResult.none),
    );
  }
}
