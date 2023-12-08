import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../json_converters/date_time_json_converter.dart';

part 'live_location.freezed.dart';
part 'live_location.g.dart';

@freezed
class LiveLocation with _$LiveLocation {
  const factory LiveLocation({
    /// The latitude of this position in degrees normalized to the interval -90.0
    /// to +90.0 (both inclusive).
    required double latitude,

    /// The longitude of the position in degrees normalized to the interval -180
    /// (exclusive) to +180 (inclusive).
    required double longitude,

    /// The estimated horizontal accuracy of the position in meters.
    ///
    /// The accuracy is not available on all devices. In these cases the value is
    /// 0.0.
    required double accuracy,

    /// The heading in which the device is traveling in degrees.
    ///
    /// The heading is not available on all devices. In these cases the value is
    /// 0.0.
    required double heading,

    /// The altitude of the device in meters.
    ///
    /// The altitude is not available on all devices. In these cases the returned
    /// value is 0.0.
    required double altitude,

    /// The speed at which the devices is traveling in meters per second over
    /// ground.
    ///
    /// The speed is not available on all devices. In these cases the value is
    /// 0.0.
    required double speed,

    /// The estimated speed accuracy of this position, in meters per second.
    ///
    /// The speedAccuracy is not available on all devices. In these cases the
    /// value is 0.0.
    required double speedAccuracy,

    /// The time at which this location was determined.
    @DateTimeJsonConverter() required DateTime timestamp,
  }) = _LiveLocation;

  factory LiveLocation.fromJson(Map<String, dynamic> json) =>
      _$LiveLocationFromJson(json);

  factory LiveLocation.empty() {
    return LiveLocation(
      latitude: 0,
      longitude: 0,
      accuracy: 0,
      heading: 0,
      altitude: 0,
      speed: 0,
      speedAccuracy: 0,
      timestamp: DateTime.now(),
    );
  }
}
