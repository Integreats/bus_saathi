import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../l10n/locale.dart';

class ConductorTag extends StatelessWidget {
  const ConductorTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          UniconsLine.user_md,
          size: 18,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          $strings.conductor,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
