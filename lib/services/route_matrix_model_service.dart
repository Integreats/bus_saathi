
// import 'package:falcon/models/route.dart';
// import 'package:falcon/models/stop.dart';

// import '../models/route_matrix_model.dart';

// class RouteMatrixModelService {
//   RouteMatrixModelService({
//     required this.route,
//   });

//   final Route route;

//   Origin getOrigin() {
//     return Origin(
//         location: Location(
//           latLng: LatLng(
//               latitude: route.origin.latitude,
//               longitude: route.origin.longitude),
//         ),
//         sideOfRoad: true);
//   }

//   Destination getDestination() {
//     return Destination(
//       location: Location(
//         latLng: LatLng(
//           latitude: route.destination.latitude,
//           longitude: route.destination.longitude,
//         ),
//       ),
//     );
//   }

//   List<Intermediate> getIntermediates() {
//     List<Intermediate> intermediates = [];
//     for (Stop stop in route.stops) {
//       intermediates.add(
//         Intermediate(
//           location: Location(
//             latLng: LatLng(latitude: stop.latitude, longitude: stop.longitude),
//           ),
//         ),
//       );
//     }
//     return intermediates;
//   }
// }
