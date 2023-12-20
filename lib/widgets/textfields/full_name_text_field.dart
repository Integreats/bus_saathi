import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../l10n/locale.dart';
import 'custom_text_form_field.dart';

class FullNameTextField extends StatelessWidget {
  const FullNameTextField({
    super.key,
    required this.readOnly,
    required this.initialValue,
    this.autoFocus = false,
    required this.onChanged,
  });

  final bool readOnly;
  final bool autoFocus;
  final ValueChanged<String> onChanged;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      readOnly: readOnly,
      label: $strings.fullName,
      autofocus: autoFocus,
      initialValue: initialValue,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[A-Za-z ]")),
      ],
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter a valid name';
        }
        return null;
      },
      onChanged: onChanged,
    );
  }
}
