import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fzregex/utils/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';

import '../../l10n/locale.dart';
import '../country_code_icon.dart';
import 'custom_text_form_field.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    super.key,
    required this.initialValue,
    required this.onChanged,
    required this.readOnly,
  });

  final String initialValue;
  final ValueChanged<String> onChanged;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      key: const ValueKey('phone_number'),
      maxLength: 10,
      initialValue: initialValue,
      readOnly: readOnly,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      label: $strings.phoneNumber,
      validator: (value) {
        if (Fzregex.hasMatch(value!, FzPattern.phone) || value.length < 10) {
          return 'Enter a valid phone number';
        }
        return null;
      },
      onChanged: onChanged,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ],
      prefixIcon: const CountryCodeIcon(),
    );
  }
}
