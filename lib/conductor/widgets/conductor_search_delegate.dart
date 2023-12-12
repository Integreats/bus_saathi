// import 'package:flutter/material.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../widgets/snackbars/show_successful_snackbar.dart';
// import '../../conductor/models/conductor_menu_options.dart';
// import '../../l10n/locale.dart';
// import '../../widgets/lottie/no_results_lottie.dart';
// import '../models/conductor.dart';
// import '../providers/conductors_list_stream_provider.dart';
// import '../repositories/conductor_repository.dart';

// class ConductorSearchDelegate extends SearchDelegate {
//   ConductorSearchDelegate();

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return <Widget>[
//       IconButton(
//         onPressed: () {
//           query = "";
//         },
//         icon: const Icon(FeatherIcons.xCircle),
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return const BackButton();
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return HookConsumer(
//       builder: (context, ref, child) {
//         final conductorsList = ref.watch(conductorsListProvider).value ?? [];
//         return buildConductorsSearchSuggestions(conductorsList);
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return HookConsumer(
//       builder: (context, ref, child) {
//         final conductorsList = ref.watch(conductorsListProvider).value ?? [];
//         return buildConductorsSearchSuggestions(conductorsList);
//       },
//     );
//   }

//   Widget buildConductorsSearchSuggestions(List<Conductor> conductors) {
//     List<Conductor> searchedConductorsResults = conductors
//         .where((element) => (element.phoneNumber
//                 .toString()
//                 .toLowerCase()
//                 .contains(query.trim().toLowerCase()) ||
//             (element.name.toLowerCase().contains(query.trim().toLowerCase()))))
//         .toList();

//     return Builder(
//       builder: (context) {
//         if (searchedConductorsResults.isEmpty) {
//           return NoResultsLottie(
//             message: $strings.conductorNotFound,
//           );
//         }
//         return HookConsumer(
//           builder: (context, ref, _) {
//             return CustomScrollView(
//               slivers: [
//                 SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                     (context, index) {
//                       Conductor currentConductor =
//                           searchedConductorsResults[index];
//                       return ConductorListTile(
//                         conductor: currentConductor,
//                         onTap: () {
//                           context.go(
//                             '${GoRouterState.of(context).uri.toString()}/conductor/read/${currentConductor.id}',
//                             extra: currentConductor,
//                           );
//                         },
//                         onMenuOptionSelected: (selectedOption) async {
//                           switch (selectedOption) {
//                             case ConductorMenuOptions.edit:
//                               context.go(
//                                 '${GoRouterState.of(context).uri.toString()}/conductor/edit/${currentConductor.id}',
//                                 extra: currentConductor,
//                               );
//                               break;
//                             case ConductorMenuOptions.remove:
//                               await ref
//                                   .read(conductorRepositoryProvider)
//                                   .deleteConductor(currentConductor)
//                                   .then((value) {
//                                 showSuccessSnackbar(
//                                   context,
//                                   title: $strings.conductorRemoved,
//                                   message:
//                                       'Successfully removed ${currentConductor.name} as Conductor!',
//                                 );
//                               });
//                               break;
//                             default:
//                           }
//                         },
//                       );
//                     },
//                     childCount: searchedConductorsResults.length,
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }

//   List<TextSpan> highlightOccurrences(String source, String query) {
//     if (query.isEmpty || !source.toLowerCase().contains(query.toLowerCase())) {
//       return [TextSpan(text: source)];
//     }
//     final matches = query.toLowerCase().allMatches(source.toLowerCase());

//     int lastMatchEnd = 0;

//     final List<TextSpan> children = [];
//     for (var i = 0; i < matches.length; i++) {
//       final match = matches.elementAt(i);

//       if (match.start != lastMatchEnd) {
//         children.add(TextSpan(
//           text: source.substring(lastMatchEnd, match.start),
//         ));
//       }

//       children.add(TextSpan(
//         text: source.substring(match.start, match.end),
//         style: const TextStyle(fontWeight: FontWeight.bold),
//       ));

//       if (i == matches.length - 1 && match.end != source.length) {
//         children.add(TextSpan(
//           text: source.substring(match.end, source.length),
//         ));
//       }

//       lastMatchEnd = match.end;
//     }
//     return children;
//   }
// }
