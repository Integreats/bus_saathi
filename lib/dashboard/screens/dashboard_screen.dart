import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../locale/locale.dart';
import '../../widgets/track_form.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              $strings.dashboard,
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Hi!',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 40,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 30),
                    child: Text(
                      //TODO: Add name here
                      r"$Name",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 27,
                          ),
                    ),
                  ),
                  const TrackForm()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
