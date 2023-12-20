import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/locale.dart';
import '../views/emergency_contacts_list_view.dart';

class EmergencyContactsScreen extends ConsumerWidget {
  const EmergencyContactsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              $strings.emergencyContacts,
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.add_rounded,
              ),
              label: const SizedBox(),
              onPressed: () {
                context.go(
                  '${GoRouterState.of(context).uri.toString()}/create/_',
                );
              },
            ),
          ],
        ),
      ),
      body: const EmergencyContactsListView(),
    );
  }
}
