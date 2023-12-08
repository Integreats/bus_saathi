import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/authentication_controller_provider.dart';
import 'auth_button.dart';

class OAuthsButtons extends HookConsumerWidget {
  const OAuthsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isGoogleAuthAvailable = false;

    if (kIsWeb) {
      isGoogleAuthAvailable = true;
    } else if (Platform.isAndroid || Platform.isIOS) {
      isGoogleAuthAvailable = true;
    } else {
      isGoogleAuthAvailable = false;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Builder(
          builder: (context) {
            if (isGoogleAuthAvailable) {
              return AuthButton(
                imagePath: "icons/auth_logo/google_logo.png",
                onTap: () async {
                  await ref
                      .read(authenticationControllerProvider.notifier)
                      .signInWithGoogle();
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
