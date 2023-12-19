import 'package:bus_saathi/l10n/locale.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../themes/custom_colors.dart';
import '../providers/buses_list_provider.dart';

class BusRoutesCountCard extends StatelessWidget {
  const BusRoutesCountCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 96,
        decoration: BoxDecoration(
          color: CustomColors.black,
          borderRadius: BorderRadius.circular(27),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  $strings.busRoutes,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFFAE3D9),
                      ),
                ),
                HookConsumer(
                  builder: (context, ref, _) {
                    final streamBuilder = ref.watch(busesListProvider);
                    return streamBuilder.when(
                      data: (data) {
                        return Text(
                          data.length.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: const Color(0xFFDCD6F7),
                              ),
                        );
                      },
                      error: (error, stackTrace) {
                        return Text(
                          "?",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: const Color(0xFFF4EEFF),
                              ),
                        );
                      },
                      loading: () {
                        return Text(
                          "0",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: const Color(0xFFF4EEFF),
                              ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
