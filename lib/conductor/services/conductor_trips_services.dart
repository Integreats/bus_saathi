import '../../trip_management/models/trip.dart';

class ConductorTripsServices {
  static Trip? getCurrentTrip(List<Trip> trips) {
    try {
      return trips.singleWhere(
        (element) => (element.startDateTime.isBefore(DateTime.now()) &&
            element.endDateTime.isAfter(DateTime.now())),
      );
    } catch (e) {
      return null;
    }
  }
}
