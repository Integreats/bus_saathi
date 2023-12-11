import 'dart:async';
import 'package:sensors_plus/sensors_plus.dart';

class SOSManager {
  AccelerometerEvent? _accelerometerValues;
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;

  void initializeAccelerometer() {
    _accelerometerSubscription = accelerometerEvents.listen(
      (AccelerometerEvent event) {
        _accelerometerValues = event;

        if (_isShaking(event)) {
          _generateSOS();
        }
      },
    );
  }

  bool _isShaking(AccelerometerEvent event) {
    const double shakeThreshold = 12.0;
    return (event.x.abs() > shakeThreshold ||
        event.y.abs() > shakeThreshold ||
        event.z.abs() > shakeThreshold);
  }

  void _generateSOS() {
    // Implement the logic to send an SOS signal
    // For example, you can show a dialog, send an alert, or perform any other action
    print('SOS generated!');
  }

  void stopAccelerometer() {
    _accelerometerSubscription?.cancel();
  }
}
