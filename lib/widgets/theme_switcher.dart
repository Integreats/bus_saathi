import 'package:aesthetic_widgets/aesthetic_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/app_user_preferences_provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HookConsumer(
      builder: (context, ref, _) {
        return AestheticThemePickerTabBar(
          initialThemeMode: ref.watch(
              appUserPreferencesProvider.select((value) => value.themeMode)),
          onChanged:
              ref.read(appUserPreferencesProvider.notifier).updateThemeMode,
        );
      },
    );
  }
}
