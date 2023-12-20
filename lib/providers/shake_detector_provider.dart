import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';

import '../services/shake_detctor.dart';

final shakeDetectorProvider = Provider.autoDispose<void>((ref) {
  ShakeDetector.autoStart(
      shakeThresholdGravity: 7,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      minimumShakeCount: 3,
      onPhoneShake: () async {
        if (await Vibration.hasVibrator() ?? false) {
          if (await Vibration.hasCustomVibrationsSupport() ?? false) {
            await Vibration.vibrate(duration: 1000);
          } else {
            await Vibration.vibrate();
            await Future.delayed(const Duration(milliseconds: 500));
            await Vibration.vibrate();
          }
        }
        // String messageBody =
        //     "https://www.google.com/maps/search/?api=1&query=${_curentPosition!.latitude}%2C${_curentPosition!.longitude}";
        // sendMessage(messageBody);
      });
  return;
});
