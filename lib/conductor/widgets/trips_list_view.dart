// import 'package:flutter/material.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:intl/intl.dart';
// import 'package:unicons/unicons.dart';

// import '../../trip_management/models/trip.dart';
// import '../../trip_management/providers/conductor_completed_trips_provider.dart';
// import '../../widgets/lottie/error_found_lottie.dart';
// import '../../widgets/lottie/loading_lottie.dart';
// import '../../widgets/lottie/no_results_lottie.dart';
// import '../../widgets/tile_layout.dart';
// import '../models/conductor.dart';

// class ConductorTripsListView extends HookConsumerWidget {
//   const ConductorTripsListView({
//     Key? key,
//     this.showRecent = false,
//   }) : super(key: key);

//   final bool showRecent;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     Conductor conductor = ref.watch(appUserProvider)?.user as Conductor;

//     final conductorsTripBuilder =
//         ref.watch(conductorCompletedTripsListProvider(conductor));
//     return conductorsTripBuilder.when(
//       error: (error, stackTrace) {
//         return const SliverToBoxAdapter(
//           child: ErrorFoundLottie(
//               message: "An error occured while fetching trips"),
//         );
//       },
//       loading: () {
//         return const SliverToBoxAdapter(
//           child: LoadingLottie(),
//         );
//       },
//       data: (data) {
//         return data.isEmpty
//             ? const SliverToBoxAdapter(
//                 child: NoResultsLottie(
//                   message: 'Your past trips will appear here',
//                 ),
//               )
//             : SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                   (context, index) {
//                     Trip currentTrip = data[index];
//                     return TileLayout(
//                       onTap: () {
//                         context.push(
//                           '${GoRouterState.of(context).uri.toString()}/trips/trip/${currentTrip.id}',
//                           extra: currentTrip,
//                         );
//                       },
//                       listTile: ListTile(
//                         leading: const Icon(
//                           UniconsLine.map,
//                         ),
//                         title: Text(DateFormat('MMMM d, yyy | h:mm a')
//                             .format(currentTrip.startDateTime)),
//                         trailing: const Icon(FeatherIcons.chevronRight),
//                       ),
//                     );
//                   },
//                   childCount: showRecent
//                       ? (data.length < 5 ? data.length : 5)
//                       : data.length,
//                 ),
//               );
//       },
//     );
//   }
// }
