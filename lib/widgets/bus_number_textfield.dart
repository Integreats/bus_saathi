import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../locale/locale.dart';
import 'textfields/custom_text_form_field.dart';

class BusNumberTextField extends StatefulWidget {
  const BusNumberTextField({
    super.key,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
  });

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String?>? onSaved;

  @override
  State<BusNumberTextField> createState() => _BusNumberTextFieldState();
}

class _BusNumberTextFieldState extends State<BusNumberTextField> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: textEditingController,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      textCapitalization: TextCapitalization.characters,
      keyboardType: TextInputType.name,
      label: $strings.busNumber,
      suffixIcon: GestureDetector(
        onTap: () {
          textEditingController.clear();
        },
        child: const Icon(FeatherIcons.xCircle),
      ),
      hintText: "KA67AB7890",
    );
  }
}
