// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../bus_routes/models/bus_route.dart';

class ConductorPreferences {
  const ConductorPreferences({
    this.busRoute,
  });
  final BusRoute? busRoute;

  ConductorPreferences copyWith({
    BusRoute? busRoute,
  }) {
    return ConductorPreferences(
      busRoute: busRoute ?? this.busRoute,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'busRoute': busRoute?.toJson(),
    };
  }

  factory ConductorPreferences.fromMap(Map<String, dynamic> map) {
    return ConductorPreferences(
      busRoute: map['busRoute'] != null
          ? BusRoute.fromJson(map['busRoute'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConductorPreferences.fromJson(String source) =>
      ConductorPreferences.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ConductorPreferences(busRoute: $busRoute)';

  @override
  bool operator ==(covariant ConductorPreferences other) {
    if (identical(this, other)) return true;

    return other.busRoute == busRoute;
  }

  @override
  int get hashCode => busRoute.hashCode;
}
