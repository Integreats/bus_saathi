// import 'package:bus_saathi_partner/conductor/providers/conductor_bus_provider.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:intl/intl.dart';

// import '../../../services/map_markers.dart';
// import '../../app_preferences/providers/app_user_preferences_provider.dart';
// import '../../bus/models/bus.dart';
// import '../../l10n/locale.dart';
// import '../../trip_management/models/trip.dart';
// import '../../trip_management/widgets/trip_route_table.dart';
// import '../widgets/conuductor_map_view.dart';

// class ConductorTripScreen extends StatefulHookConsumerWidget {
//   const ConductorTripScreen({
//     super.key,
//     required this.trip,
//   });

//   final Trip trip;

//   @override
//   ConsumerState<ConductorTripScreen> createState() =>
//       _ConductorTripScreenState();
// }

// class _ConductorTripScreenState extends ConsumerState<ConductorTripScreen>
//     with WidgetsBindingObserver {
//   late final GoogleMapController controller;

//   late Trip trip;
//   late LatLng initialPosition;
//   late List<LatLng> polyLinesPositions;
//   late Bus bus;
//   late String darkMapStyle;
//   late String lightMapStyle;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     loadMapStyles();
//     trip = widget.trip;
//     polyLinesPositions = trip.liveLocation.map((e) => e.toLatLng()).toList();
//     if (polyLinesPositions.length == 1) {
//       initialPosition = polyLinesPositions.first;
//     } else {
//       initialPosition = polyLinesPositions[polyLinesPositions.length ~/ 2];
//     }

//     bus = ref.read(conductorBusProvider).value!;
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
//     final theme = PlatformDispatcher.instance.platformBrightness;
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
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           DateFormat('MMM d | h:m a').format(widget.trip.startDateTime),
//         ),
//       ),
//       body: CustomScrollView(
//         slivers: [
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.67,
//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(27),
//                       bottomRight: Radius.circular(27),
//                     ),
//                     child: GoogleMap(
//                       mapType: MapType.normal,
//                       myLocationEnabled: true,
//                       zoomControlsEnabled: false,
//                       scrollGesturesEnabled: true,
//                       onMapCreated: (mapController) async {
//                         controller = mapController;
//                         ThemeMode themeMode = ref
//                             .read(appUserPreferencesProvider)
//                             .requireValue
//                             .themeMode;
//                         await controller.animateCamera(
//                             CameraUpdate.newLatLngZoom(initialPosition, 15));
//                         if (themeMode == ThemeMode.system) {
//                           await setMapStyle();
//                         } else if (themeMode == ThemeMode.dark) {
//                           await controller.setMapStyle(darkMapStyle);
//                         } else {
//                           await controller.setMapStyle(lightMapStyle);
//                         }
//                       },
//                       markers: {
//                         MapMarkers.getGreenMarker(trip.liveLocation.last),
//                         MapMarkers.getRedMarker(trip.liveLocation.first),
//                       },
//                       polylines: {
//                         Polyline(
//                           polylineId: const PolylineId('Path'),
//                           points: polyLinesPositions,
//                           width: 3,
//                           jointType: JointType.round,
//                         ),
//                       },
//                       initialCameraPosition: CameraPosition(
//                         target: initialPosition,
//                         zoom: 15,
//                       ),
//                       gestureRecognizers: {
//                         Factory<OneSequenceGestureRecognizer>(
//                           () => EagerGestureRecognizer(),
//                         ),
//                       },
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8.0),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   '${$strings.trips} ID',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleMedium!
//                                       .copyWith(
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                 ),
//                                 Text(
//                                   trip.id,
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   $strings.licenseNumber,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleMedium!
//                                       .copyWith(
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                 ),
//                                 Text(
//                                   bus.licensePlateNumber,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       AnimatedOpacity(
//                         opacity: 1.0,
//                         duration: const Duration(seconds: 1),
//                         child: DateTimeInformationCard(
//                           dateTitle: $strings.startDate,
//                           timeTitle: $strings.startTime,
//                           dateTime: trip.startDateTime,
//                         ),
//                       ),
//                       const Divider(
//                         indent: 80,
//                         endIndent: 80,
//                         thickness: 2.0,
//                       ),
//                       AnimatedOpacity(
//                         opacity: 1.0,
//                         duration: const Duration(seconds: 1, milliseconds: 200),
//                         child: DateTimeInformationCard(
//                           dateTitle: $strings.endDate,
//                           timeTitle: $strings.endTime,
//                           dateTime: trip.endDateTime,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 TripRouteTable(
//                   trip: trip,
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DateTimeInformationCard extends StatelessWidget {
//   const DateTimeInformationCard({
//     super.key,
//     required this.dateTitle,
//     required this.timeTitle,
//     required this.dateTime,
//   });
//   final String dateTitle;
//   final String timeTitle;
//   final DateTime dateTime;

//   String dateFormatter(DateTime dateTime) {
//     return DateFormat('MMMM dd, yyyy').format(dateTime);
//   }

//   String timeFomatter(DateTime dateTime) {
//     return DateFormat('h:m a').format(dateTime);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Column(
//           children: [
//             Text(
//               dateTitle,
//               style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     fontWeight: FontWeight.w500,
//                   ),
//             ),
//             Text(
//               dateFormatter(dateTime),
//               style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ),
//             ),
//           ],
//         ),
//         Column(
//           children: [
//             Text(
//               timeTitle,
//               style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     fontWeight: FontWeight.w500,
//                   ),
//             ),
//             Text(
//               timeFomatter(dateTime),
//               style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
