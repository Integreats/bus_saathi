// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../themes/custom_colors.dart';
// import '../../app_permissions/providers/app_permissions_controller.dart';
// import '../../bus_routes/models/bus_route.dart';
// import '../../bus_stops/models/bus_stop.dart';
// import '../../trip_management/models/live_location.dart';

// extension LatLangExtension on LiveLocation {
//   LatLng toLatLng() {
//     return LatLng(
//       latitude,
//       longitude,
//     );
//   }
// }

// class ConductorMapView extends StatefulHookConsumerWidget {
//   const ConductorMapView({
//     super.key,
//   });

//   @override
//   ConsumerState<ConductorMapView> createState() => ConductorMapViewState();
// }

// class ConductorMapViewState extends ConsumerState<ConductorMapView>
//     with WidgetsBindingObserver {
//   late final GoogleMapController controller;
//   late LatLng initialPosition;

//   late String darkMapStyle;
//   late String lightMapStyle;

//   Polyline routeLine = const Polyline(
//     polylineId: PolylineId('busRoute'),
//     color: CustomColors.deepBlue,
//     jointType: JointType.round,
//     width: 5,
//   );

//   Set<Marker> stopsMarkers = {};

//   late Set<Polyline> polylines;
//   @override
//   void initState() {
//     MapMarkers.init();
//     super.initState();
//     polylines = {};
//     WidgetsBinding.instance.addObserver(this);
//     loadMapStyles();
//     initialPosition = const LatLng(
//       12.966154,
//       77.605565,
//     );
//     BusRoute? busRoute = ref
//         .read(conductorPreferencesProvider.select((value) => value.busRoute));
//     if (busRoute != null) {
//       plotRouteMarkersPolylines(busRoute);
//     }
//   }

//   @override
//   void didChangePlatformBrightness() {
//     setMapStyle();
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   Future loadMapStyles() async {
//     darkMapStyle = await rootBundle.loadString('map_styles/dark_theme.json');
//     lightMapStyle = await rootBundle.loadString('map_styles/light_theme.json');
//   }

//   Future setMapStyle() async {
//     final theme = WidgetsBinding.instance.window.platformBrightness;
//     if (theme == Brightness.dark) {
//       await controller.setMapStyle(darkMapStyle);
//     } else {
//       await controller.setMapStyle(lightMapStyle);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     ref.listen(
//       appUserPreferencesProvider
//           .select((value) => value.requireValue.themeMode),
//       (previous, next) async {
//         if (next == ThemeMode.system) {
//           await setMapStyle();
//         } else if (next == ThemeMode.dark) {
//           await controller.setMapStyle(darkMapStyle);
//         } else {
//           await controller.setMapStyle(lightMapStyle);
//         }
//         setState(() {});
//       },
//     );
//     ref.listen(
//       conductorPreferencesProvider.select((value) => value.busRoute),
//       (previous, next) {
//         if (next != null) {
//           plotRouteMarkersPolylines(next);
//         } else {
//           polylines = {};
//           stopsMarkers = {};
//         }
//         setState(() {});
//       },
//     );
//     return ClipRRect(
//       borderRadius: const BorderRadius.only(
//         bottomLeft: Radius.circular(27),
//         bottomRight: Radius.circular(27),
//       ),
//       child: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: initialPosition,
//           zoom: 15,
//         ),
//         onMapCreated: (mapController) async {
//           controller = mapController;
//           try {
//             final appPermissions = ref.read(appPermissionsControllerProvider);
//             if (!appPermissions.isGpsEnabled) {
//               Position locationData = await Geolocator.getCurrentPosition();
//               initialPosition =
//                   LatLng(locationData.latitude, locationData.longitude);
//               controller.animateCamera(
//                 CameraUpdate.newLatLng(initialPosition),
//               );
//             }
//           } catch (e) {
//             controller.animateCamera(
//               CameraUpdate.newLatLngZoom(
//                 initialPosition,
//                 11,
//               ),
//             );
//           }
//           ThemeMode themeMode =
//               ref.read(appUserPreferencesProvider).requireValue.themeMode;
//           if (themeMode == ThemeMode.system) {
//             await setMapStyle();
//           } else if (themeMode == ThemeMode.dark) {
//             await controller.setMapStyle(darkMapStyle);
//           } else {
//             await controller.setMapStyle(lightMapStyle);
//           }
//         },
//         polylines: polylines,
//         markers: stopsMarkers,
//         myLocationButtonEnabled: true,
//         myLocationEnabled: true,
//         zoomControlsEnabled: false,
//         scrollGesturesEnabled: true,
//         mapType: MapType.normal,
//         gestureRecognizers: {
//           Factory<OneSequenceGestureRecognizer>(
//             () => EagerGestureRecognizer(),
//           ),
//         },
//       ),
//     );
//   }

//   plotRouteMarkersPolylines(BusRoute busRoute) {
//     List<LatLng> coordinates = [];
//     Set<Marker> markers = {};
//     coordinates
//         .add(LatLng(busRoute.origin.latitude, busRoute.origin.longitude));
//     markers.add(MapMarkers.getOriginStopMarker(busRoute));

//     for (BusStop busStop in busRoute.stops) {
//       LatLng coordinate = LatLng(busStop.latitude, busStop.longitude);
//       coordinates.add(coordinate);
//       markers.add(MapMarkers.getStopMarker(busStop));
//     }
//     coordinates.add(
//         LatLng(busRoute.destination.latitude, busRoute.destination.longitude));
//     markers.add(MapMarkers.getDestinationStopMarker(busRoute));
//     routeLine = routeLine.copyWith(pointsParam: coordinates);
//     polylines = {
//       routeLine,
//     };
//     stopsMarkers = markers;
//   }
// }
