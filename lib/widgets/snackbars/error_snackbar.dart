import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ErrorSnackBar extends StatelessWidget {
  const ErrorSnackBar({
    super.key,
    required this.message,
  });

  final String message;

  @override
  SnackBar build(BuildContext context) {
    final theme = Theme.of(context);
    return SnackBar(
      elevation: 0,
      showCloseIcon: true,
      closeIconColor: theme.colorScheme.error,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: theme.colorScheme.error,
        ),
      ),
      backgroundColor: theme.colorScheme.errorContainer,
      behavior: SnackBarBehavior.floating,
      content: ListTile(
        leading: Icon(
          FeatherIcons.alertOctagon,
          color: theme.colorScheme.error,
        ),
        title: Text(
          message,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onErrorContainer,
              ),
        ),
      ),
    );
  }
}
