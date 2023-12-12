import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/lottie/error_found_lottie.dart';
import '../../../widgets/lottie/loading_lottie.dart';
import '../../../widgets/lottie/no_results_lottie.dart';
import '../../../widgets/search_bar_placeholder.dart';
import '../providers/buses_list_provider.dart';
import '../widgets/bus_list_tile.dart';
import '../widgets/bus_search_delegate.dart';

class BusListView extends HookConsumerWidget {
  const BusListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final busList = ref.watch(busesListProvider);
    return busList.when(
      error: (error, stackTrace) {
        debugPrintStack(
          label: error.toString(),
          stackTrace: stackTrace,
        );
        return const ErrorFoundLottie(message: "Oops! there's some error");
      },
      loading: () {
        return const LoadingLottie();
      },
      data: (data) {
        return data.isEmpty
            ? const NoResultsLottie(
                message: "Bus added will appear here",
              )
            : CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: SearchBarPlaceholder(
                        onTap: () {
                          showSearch(
                            context: context,
                            delegate: BusSearchDelegate(),
                          );
                        },
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final currentBus = data[index];
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
                      childCount: data.length,
                    ),
                  )
                ],
              );
      },
    );
  }
}
