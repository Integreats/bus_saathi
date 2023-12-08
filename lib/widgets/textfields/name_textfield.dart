import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'custom_text_form_field.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
    Key? key,
    this.label = "",
    this.onSaved,
    this.onChanged,
  }) : super(key: key);

  final String label;
  final void Function(String? value)? onSaved;
  final void Function(String? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      key: ValueKey(label),
      autocorrect: false,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.words,
      enableSuggestions: false,
      autofillHints: const [AutofillHints.email],
      keyboardType: TextInputType.name,
      onChanged: onChanged,
      onSaved: onSaved,
      label: label,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Icon(
          FeatherIcons.user,
          color: Theme.of(context).iconTheme.color!,
          size: 16,
        ),
      ),
    );
  }
}
