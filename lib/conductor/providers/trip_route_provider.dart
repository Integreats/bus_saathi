import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../trip_management/models/trip_route.dart';

// final tripRouteProvider = StateProvider<TripRoute?>((ref) {
//   final busRoute =
//       ref.watch(conductorPreferencesProvider.select((value) => value.busRoute));

//   if (busRoute != null) {
//     return TripRoute(
//       id: busRoute.id,
//       origin: busRoute.origin,
//       destination: busRoute.destination,
//       stops: busRoute.stops,
//     );
//   } else {
//     return null;
//   }
// });
