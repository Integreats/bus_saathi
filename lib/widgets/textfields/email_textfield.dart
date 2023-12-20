import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'custom_text_form_field.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
    this.onChanged,
    this.initialValue,
    required this.readOnly,
  }) : super(key: key);

  final String? initialValue;
  final bool readOnly;
  final void Function(String? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      readOnly: readOnly,
      key: const ValueKey('email'),
      initialValue: initialValue,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.email],
      enableSuggestions: true,
      autocorrect: false,
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
      label: 'abc@xyz.com',
      prefixIcon: const Icon(
        FeatherIcons.mail,
        size: 16,
      ),
    );
  }
}
