import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notification_permissions/notification_permissions.dart'
    as notification_permissions;
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;

import '../models/app_permissions.dart';

final locationPermissionsProvider = StreamProvider<bool>((ref) async* {
  await for (final locationStream in Geolocator.getServiceStatusStream()) {
    if (locationStream == ServiceStatus.enabled) {
      yield true;
    } else {
      yield false;
    }
  }
});

final appPermissionsControllerProvider =
    AsyncNotifierProvider<AppPermissionsNotifier, AppPermissions>(
        AppPermissionsNotifier.new);

class AppPermissionsNotifier extends AsyncNotifier<AppPermissions> {
  @override
  Future<AppPermissions> build() async {
    await requestPerimssions();
    final locationPermissions = ref.watch(locationPermissionsProvider);
    return AppPermissions.raw().copyWith(
      isGpsEnabled: locationPermissions.value ?? false,
    );
  }

  Future<void> checkPerimssions() async {
    await isBatteryOptimizationDisabled();
    await isLocationServicesEnabled();
    await isNotificationServiceEnabled();
  }

  Future<void> requestPerimssions() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await requestDisableBatteryOptimization();
      await requestLocationServices();
      await requestNotificationService();
      return state.value!;
    });
  }

  Future<void> isBatteryOptimizationDisabled() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final isDisabled = await permission_handler
          .Permission.ignoreBatteryOptimizations.isGranted;
      return state.value!.copyWith(
        isBatteryOptimizationDisabled: isDisabled,
      );
    });
  }

  Future<void> requestDisableBatteryOptimization() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await permission_handler.Permission.ignoreBatteryOptimizations.request();
      final isGranted = await permission_handler
          .Permission.ignoreBatteryOptimizations.isGranted;
      return state.value!.copyWith(isBatteryOptimizationDisabled: isGranted);
    });
  }

  Future<void> isNotificationServiceEnabled() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      bool isEnabled =
          await permission_handler.Permission.notification.isGranted;
      return state.value!.copyWith(isAppNotificationsAllowed: isEnabled);
    });
  }

  Future<void> requestNotificationService() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await notification_permissions.NotificationPermissions
          .requestNotificationPermissions();
      final isEnabled =
          await permission_handler.Permission.notification.isGranted;

      return state.value!.copyWith(isAppNotificationsAllowed: isEnabled);
    });
  }

  Future<void> isLocationServicesEnabled() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final permission = await Geolocator.checkPermission();
      final isGranted = permission != LocationPermission.always ? false : true;
      final isEnabled = await Geolocator.isLocationServiceEnabled();
      return state.value!.copyWith(
        isGpsEnabled: (isEnabled && isGranted),
      );
    });
  }

  /// Requests permissions based on the current state of location status which includes both permission & service status.
  /// Requests for granting permissions when permissions is false. Requests for enabling service when service status is false.
  Future<void> requestLocationServices() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await isLocationServicesEnabled();
      if (state.value!.isGpsEnabled) {
        return state.value!;
      }
      await permission_handler.Permission.locationAlways.request();
      final isPermissionGranted =
          await permission_handler.Permission.locationAlways.isGranted;
      await permission_handler.Permission.location.request();
      final isEnabled = await permission_handler.Permission.location.isGranted;
      final isGpsServiceEnable = (isPermissionGranted && isEnabled);
      return state.value!.copyWith(isGpsEnabled: isGpsServiceEnable);
    });
  }

  bool areAllServicesActive() {
    if (state.value!.isAppNotificationsAllowed &&
        state.value!.isBatteryOptimizationDisabled &&
        state.value!.isGpsEnabled) {
      return true;
    } else {
      return false;
    }
  }
}
