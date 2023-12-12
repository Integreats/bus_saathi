import 'package:extension_utilities/extension_utilities.dart';
import 'package:flutter/material.dart';

enum EnergySource {
  electricity,
  petrol,
  diesel,
  hydrogen,
  hybrid,
}

extension EnergySourceExt on EnergySource {
  String get label {
    return name.capitalizeAllWords();
  }

  IconData get iconData {
    switch (this) {
      case EnergySource.electricity:
        return Icons.battery_charging_full_outlined;
      case EnergySource.petrol:
        return Icons.local_gas_station_outlined;
      case EnergySource.diesel:
        return Icons.local_gas_station_outlined;
      case EnergySource.hybrid:
        return Icons.battery_charging_full_outlined;
      case EnergySource.hydrogen:
        return Icons.battery_charging_full_outlined;
      default:
        return Icons.battery_charging_full_outlined;
    }
  }
}
