import 'package:freezed_annotation/freezed_annotation.dart';

import '../../bus_stops/models/bus_stop.dart';

part 'trip_planner_form.freezed.dart';
part 'trip_planner_form.g.dart';

@freezed
class TripPlannerForm with _$TripPlannerForm {
  factory TripPlannerForm({
    required BusStop origin,
    required BusStop destination,
  }) = _TripPlannerForm;

  factory TripPlannerForm.fromJson(Map<String, dynamic> json) =>
      _$TripPlannerFormFromJson(json);
}
