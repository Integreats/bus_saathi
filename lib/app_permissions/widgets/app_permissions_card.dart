import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppPermissionsCard extends StatelessWidget {
  const AppPermissionsCard({
    Key? key,
    required this.label,
    required this.state,
    this.onTap,
    this.icon,
    this.trueStateIcon,
    this.falseStateIcon,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String label;
  final bool state;
  final IconData? icon;
  final IconData? trueStateIcon;
  final IconData? falseStateIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () async {
        await HapticFeedback.heavyImpact();

        if (onTap != null) {
          onTap!();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        height: 96,
        decoration: BoxDecoration(
          color: state
              ? theme.colorScheme.secondaryContainer
              : theme.colorScheme.primary.withOpacity(0.05),
          borderRadius: BorderRadius.circular(27),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Builder(
                builder: (context) {
                  Widget child;
                  if (icon != null) {
                    child = Icon(
                      icon,
                      color: theme.colorScheme.onPrimaryContainer,
                    );
                  } else {
                    if (state) {
                      child = Icon(
                        trueStateIcon,
                        color: theme.colorScheme.onPrimaryContainer,
                      );
                    } else {
                      child = Icon(
                        falseStateIcon,
                        color: theme.colorScheme.onPrimaryContainer,
                      );
                    }
                  }
                  return child;
                },
              ),
            ),
            Flexible(
              flex: 2,
              child: Text(
                label,
                softWrap: true,
                overflow: TextOverflow.clip,
                style: theme.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
