import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/snackbars/show_successful_snackbar.dart';
import '../../l10n/locale.dart';
import '../../widgets/lottie/error_found_lottie.dart';
import '../../widgets/lottie/loading_lottie.dart';
import '../../widgets/lottie/no_results_lottie.dart';
import '../models/emergency_contact_menu_options.dart';
import '../providers/emergency_contacts_list_provider.dart';
import '../repositories/sos_repository.dart';
import '../widgets/emergency_contact_list_tile.dart';

class EmergencyContactsListView extends HookConsumerWidget {
  const EmergencyContactsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emergencyContactsListStream =
        ref.watch(emergencyContactsListProvider);

    return emergencyContactsListStream.when(
      error: (error, stackTrace) {
        debugPrintStack(label: error.toString(), stackTrace: stackTrace);
        return const ErrorFoundLottie(message: "Oops! there's some error");
      },
      loading: () {
        return const LoadingLottie();
      },
      data: (data) {
        return data.isEmpty
            ? NoResultsLottie(
                message: $strings.emergencyContactsAddedWillAppearHere,
              )
            : CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final currentEmergencyContacts = data[index];
                        return EmergencyContactListTile(
                          emergencyContact: currentEmergencyContacts,
                          onTap: () {
                            context.go(
                              '${GoRouterState.of(context).uri.toString()}/read/${currentEmergencyContacts.id}',
                              extra: currentEmergencyContacts,
                            );
                          },
                          onMenuOptionSelected: (selectedOption) async {
                            switch (selectedOption) {
                              case EmergencyContactMenuOptions.edit:
                                context.go(
                                  '${GoRouterState.of(context).uri.toString()}/conductor/edit/${currentEmergencyContacts.id}',
                                  extra: currentEmergencyContacts,
                                );
                                break;
                              case EmergencyContactMenuOptions.remove:
                                await ref
                                    .read(sosRepositoryProvider)
                                    .deleteEmergencyContact(
                                        currentEmergencyContacts)
                                    .then((value) {
                                  showSuccessSnackbar(
                                    context,
                                    title: $strings.conductorRemoved,
                                    message:
                                        'Successfully removed ${currentEmergencyContacts.name} as EmergencyContacts!',
                                  );
                                });

                                break;
                              default:
                            }
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
