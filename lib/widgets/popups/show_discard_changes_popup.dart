import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/locale.dart';

Future<void> showDiscardChangesPopup(
  BuildContext context, {
  Function? onConfirmDiscard,
}) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('${$strings.discardChanges}?'),
        content: Text(
          $strings.discardUnsavedChanges,
        ),
        actions: [
          TextButton(
            onPressed: () {
              onConfirmDiscard?.call();
              context.pop();
            },
            child: Text($strings.discard),
          ),
          TextButton(
            onPressed: context.pop,
            child: Text($strings.cancel),
          ),
        ],
      );
    },
  );
}
