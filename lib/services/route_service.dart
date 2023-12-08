// import 'dart:convert';

// import 'package:falcon/models/route.dart';
// import 'package:falcon/models/route_matrix_model.dart';
// import 'package:falcon/models/stop.dart';
// import 'package:falcon/models/trip.dart';
// import 'package:falcon/services/route_matrix_model_service.dart';
// import 'package:http/http.dart';
// import 'package:intl/intl.dart';

// class RoutesService {
//   final Client _client;
//   RoutesService({
//     required Client client,
//   }) : _client = client;

//   final String _apiKey = "AIzaSyCHrbhDAGjLmJDwU4FgTLqOWQ_1xslTXRs";
//   List<String> encodedPolylines = [];
//   Future<Route> getRouteETA({
//     required Trip currentTrip,
//     String? travelMode,
//     String? routingPreference,
//     String? languageCode,
//     String? units,
//   }) async {
//     //Getting Route
//     Route route = currentTrip.route!;
//     RouteMatrixModelService matrixModelService =
//         RouteMatrixModelService(route: route);
//     RouteMatrixModel routeModel = RouteMatrixModel(
//       origin: matrixModelService.getOrigin(),
//       destination: matrixModelService.getDestination(),
//       intermediates: matrixModelService.getIntermediates(),
//       travelMode: travelMode ?? "DRIVE",
//       routingPreference: routingPreference ?? "TRAFFIC_AWARE",
//     );

//     //Creating Request
//     Response res = await _client.post(
//         Uri.parse('https://routes.googleapis.com/directions/v2:computeRoutes'),
//         body: routeModel.toJson(),
//         headers: {
//           "Content-Type": "application/json",
//           'X-Goog-FieldMask':
//               'routes.duration,routes.distanceMeters,routes.legs',
//           'X-Goog-Api-Key': _apiKey,
//         });
//     Map<String, dynamic> responseBody = jsonDecode(res.body);

//     List<Map<String, dynamic>> legs =
//         List<Map<String, dynamic>>.from(responseBody["routes"][0]["legs"]);
//     List<Stop> stopsWithETA = [];
//     int secondSum = 0;
//     int totalDuration =
//         int.tryParse(responseBody["routes"][0]["duration"].split("s")[0]) ?? 0;

//     for (int i = 0; i < route.stops.length; i++) {
//       secondSum += int.tryParse(legs[i]['duration'].split("s")[0]!) ?? 0;
//       DateTime arrival = currentTrip.startDateTime.add(
//         Duration(seconds: secondSum),
//       );
//       DateTime departure = arrival.add(const Duration(minutes: 1));
//       stopsWithETA.add(
//         Stop(
//           id: route.stops[i].id,
//           name: route.stops[i].name,
//           latitude: route.stops[i].latitude,
//           longitude: route.stops[i].longitude,
//           arrival: DateFormat("h:mma").format(arrival),
//           departure: DateFormat("h:mma").format(departure),
//         ),
//       );
//     }

//     Stop originWithETA = route.origin.copyWith(
//       arrival: "--",
//       departure: DateFormat("h:mma").format(currentTrip.startDateTime),
//     );
//     Stop destinationWithETA = route.destination.copyWith(
//       departure: "--",
//       arrival: DateFormat("h:mma").format(
//         currentTrip.startDateTime.add(
//           Duration(seconds: totalDuration),
//         ),
//       ),
//     );
//     Route routeWithETA = Route(
//       id: route.id,
//       origin: originWithETA,
//       destination: destinationWithETA,
//       stops: stopsWithETA,
//     );
//     encodedPolylines = getEncodedPolyline(legs);
//     return routeWithETA;
//   }

//   List<String> getEncodedPolyline(List<Map<String, dynamic>> legs) {
//     for (int i = 0; i < legs.length; i++) {
//       encodedPolylines.add(legs[i]['polyline']['encodedPolyline']);
//     }
//     return encodedPolylines;
//   }
// }
