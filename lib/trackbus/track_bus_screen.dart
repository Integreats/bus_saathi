// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../providers/current_trip_stream_provider.dart';
// import '../themes/custom_colors.dart';
// import '../trip_management/widgets/trip_route_table.dart';
// import '../widgets/map/mobile_map.dart';
// import 'widgets/trip_information_card.dart';

// class TrackBusScreen extends StatelessWidget {
//   const TrackBusScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<ScaffoldState> homePageKey = GlobalKey();
//     Size deviceSize = MediaQuery.of(context).size;
//     return Scaffold(
//       key: homePageKey,
//       body: CustomScrollView(
//         physics: const BouncingScrollPhysics(),
//         slivers: [
//           SliverAppBar(
//             automaticallyImplyLeading: false,
//             stretch: false,
//             pinned: true,
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(27),
//                 bottomRight: Radius.circular(27),
//               ),
//             ),
//             expandedHeight: deviceSize.height - (deviceSize.height / 2.75),
//             flexibleSpace: const SafeArea(
//               child: MobileMap(),
//             ),
//           ),
//           SliverPadding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             sliver: SliverList(
//               delegate: SliverChildListDelegate(
//                 [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 24.0),
//                         child: Container(
//                           width: 48,
//                           height: 6,
//                           decoration: const ShapeDecoration(
//                             color: Color(0xFF181818),
//                             shape: StadiumBorder(),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const TripInformationCard(),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SliverPadding(
//             padding: const EdgeInsets.all(8.0),
//             sliver: SliverToBoxAdapter(
//               child: HookConsumer(
//                 builder: (context, ref, _) {
//                   final trip = ref.watch(currentTripStreamProvider);
//                   return trip.when(
//                     data: (data) {
//                       return TripRouteTable(
//                         trip: data,
//                       );
//                     },
//                     error: (error, stackTrace) {
//                       return const Center(
//                         child: Text("Error"),
//                       );
//                     },
//                     loading: () {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class StopInformationCard extends StatelessWidget {
//   const StopInformationCard({
//     super.key,
//     required this.stopNumber,
//     required this.stopName,
//     required this.arrivalTime,
//   });
//   final String stopNumber;
//   final String stopName;
//   final String arrivalTime;
//   @override
//   Widget build(BuildContext context) {
//     Size deviceSize = MediaQuery.of(context).size;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: SizedBox(
//             width: deviceSize.width * 0.1,
//             child: Text(stopNumber),
//           ),
//         ),
//         SizedBox(
//           width: deviceSize.width * 0.35,
//           child: Center(
//             child: Text(stopName),
//           ),
//         ),
//         SizedBox(
//           width: deviceSize.width * 0.15,
//           child: Center(
//             child: Text(arrivalTime),
//           ),
//         ),
//         SizedBox(
//           width: deviceSize.width * 0.15,
//           child: Center(
//             child: Text("${arrivalTime}5"),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class DetailsCard extends StatelessWidget {
//   const DetailsCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Size deviceSize = MediaQuery.of(context).size;
//     return Container(
//       decoration: BoxDecoration(
//         color: CustomColors.silverWhite,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Expanded(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SizedBox(
//                 width: deviceSize.width * 0.1,
//                 child: Text(
//                   "Stop",
//                   style: Theme.of(context).textTheme.bodySmall,
//                 ),
//               ),
//               SizedBox(
//                 width: deviceSize.width * 0.4,
//                 child: Center(
//                   child: Text(
//                     "Name",
//                     style: Theme.of(context).textTheme.bodySmall,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: deviceSize.width * 0.15,
//                 child: Center(
//                   child: Text(
//                     "Arr",
//                     style: Theme.of(context).textTheme.bodySmall,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: deviceSize.width * 0.15,
//                 child: Center(
//                   child: Text(
//                     "Dep",
//                     style: Theme.of(context).textTheme.bodySmall,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
