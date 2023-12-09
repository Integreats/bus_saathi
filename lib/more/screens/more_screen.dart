import 'package:bus_saathi/authentication/providers/authentication_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../locale/locale.dart';
import '../../providers/app_user_preferences_provider.dart';
import '../../widgets/selectors/language_selector.dart';
import '../../widgets/theme_switcher.dart';
import '../../widgets/tile_layout.dart';

class MoreScreen extends HookConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              $strings.more,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            child: ThemeSwitcher(),
          ),
          TileLayout(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return LanguagePickerDialog(
                    initialLocale:
                        ref.read(appUserPreferencesProvider).value!.locale,
                    onLocaleSelected: (locale) async {
                      await ref
                          .read(appUserPreferencesProvider.notifier)
                          .updateLocale(locale);
                    },
                  );
                },
              );
            },
            listTile: ListTile(
              title: Text($strings.language),
              trailing: const Icon(
                Icons.language_rounded,
              ),
            ),
          ),
          TileLayout(
            listTile: ListTile(
              title: Text($strings.signOut),
              trailing: const Icon(
                FeatherIcons.logOut,
              ),
            ),
            onTap: () async => await signOut(ref),
          ),
        ],
      ),
    );
  }

  Future<void> signOut(WidgetRef ref) async {
    await ref.read(appUserPreferencesProvider.notifier).reset();

    await ref.read(authenticationControllerProvider.notifier).signOut();
  }
}
