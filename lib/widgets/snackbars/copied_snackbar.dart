import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:unicons/unicons.dart';

class CopiedSnackbar extends StatelessWidget {
  const CopiedSnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SnackBar(
      backgroundColor: theme.colorScheme.primary,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      width: 120,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            UniconsLine.check_circle,
            size: 18,
            color: theme.colorScheme.onPrimary,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            'Copied',
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ).animate().fadeIn().slideY(begin: 1),
    );
  }
}
