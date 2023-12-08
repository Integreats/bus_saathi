import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'custom_text_form_field.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
    this.onSaved,
  }) : super(key: key);

  final void Function(String? value)? onSaved;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      key: const ValueKey('email'),
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.email],
      enableSuggestions: true,
      autocorrect: false,
      onSaved: onSaved,
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
