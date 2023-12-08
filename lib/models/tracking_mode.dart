enum TrackingMode {
  conductorPhone,
  busNumber,
}

extension TrackingModeExtension on TrackingMode {
  static List<TrackingMode> get allModes => TrackingMode.values.toList();

  static List<String> get modeNamesList => ['Mobile Number', 'Bus Number'];

  static String getModeNameByMode(TrackingMode mode) {
    String modeName;
    switch (mode) {
      case TrackingMode.conductorPhone:
        modeName = 'Mobile Number';
        break;
      case TrackingMode.busNumber:
        modeName = 'Bus Number';
        break;
      default:
        modeName = "Mobile Number";
    }
    return modeName;
  }

  static TrackingMode getModeByIndex(int index) {
    return TrackingMode.values.elementAt(index);
  }
}
