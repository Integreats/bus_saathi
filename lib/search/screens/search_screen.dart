import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../bus_routes/providers/bus_routes_list_provider.dart';
import '../../bus_routes/widgets/bus_route_list_tile.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQueryTextController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchQueryTextController,
          decoration: const InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          Consumer(
            builder: (context, ref, child) {
              final busRoutesStream = ref.watch(busRoutesListProvider);
              return busRoutesStream.when(
                data: (busRoutes) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return BusRouteListTile(
                          busRoute: busRoutes[index],
                          onTap: () {
                            context
                                .push('/trips/${busRoutes[index].routeNumber}');
                          },
                        );
                      },
                      childCount: busRoutes.length,
                    ),
                  );
                },
                loading: () {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                error: (error, stack) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(error.toString()),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
