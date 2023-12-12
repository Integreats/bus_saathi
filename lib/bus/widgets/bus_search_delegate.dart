import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/lottie/no_results_lottie.dart';
import '../models/bus.dart';
import '../providers/buses_list_provider.dart';
import 'bus_list_tile.dart';

class BusSearchDelegate extends SearchDelegate {
  BusSearchDelegate();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(FeatherIcons.xCircle),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    return HookConsumer(
      builder: (context, ref, child) {
        final busList = ref.watch(busesListProvider).value ?? [];
        return buildSearchSuggestions(busList);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return HookConsumer(
      builder: (context, ref, child) {
        final busList = ref.watch(busesListProvider).value ?? [];
        return buildSearchSuggestions(busList);
      },
    );
  }

  Widget buildSearchSuggestions(List<Bus> bus) {
    List<Bus> searchedResults = bus
        .where((element) => ((element.routeNumber
                .toLowerCase()
                .contains(query.trim().toLowerCase())) ||
            (element.licensePlateNumber
                .toLowerCase()
                .contains(query.trim().toLowerCase()))))
        .toList();

    return Builder(
      builder: (context) {
        if (searchedResults.isEmpty) {
          return const NoResultsLottie(
            message: 'Bus  not found',
          );
        }
        return Consumer(
          builder: (context, ref, child) {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final currentBus = searchedResults[index];
                      return BusListTile(
                        bus: currentBus,
                        onTap: () {
                          context.go(
                            '${GoRouterState.of(context).uri.toString()}/bus/read/${currentBus.id}',
                            extra: currentBus,
                          );
                        },
                      );
                    },
                    childCount: searchedResults.length,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  List<TextSpan> highlightOccurrences(String source, String query) {
    if (query.isEmpty || !source.toLowerCase().contains(query.toLowerCase())) {
      return [TextSpan(text: source)];
    }
    final matches = query.toLowerCase().allMatches(source.toLowerCase());

    int lastMatchEnd = 0;

    final List<TextSpan> children = [];
    for (var i = 0; i < matches.length; i++) {
      final match = matches.elementAt(i);

      if (match.start != lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));
      }

      children.add(TextSpan(
        text: source.substring(match.start, match.end),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ));

      if (i == matches.length - 1 && match.end != source.length) {
        children.add(TextSpan(
          text: source.substring(match.end, source.length),
        ));
      }

      lastMatchEnd = match.end;
    }
    return children;
  }
}
