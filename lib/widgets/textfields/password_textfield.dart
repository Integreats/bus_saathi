import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'custom_text_form_field.dart';

class PasscodeTextField extends StatefulWidget {
  const PasscodeTextField({
    super.key,
    required this.labelName,
    this.initialValue,
    this.onSaved,
    this.validator,
    this.keyboardType = TextInputType.visiblePassword,
    this.textInputAction = TextInputAction.done,
    this.inputFormatters,
  });

  final String labelName;
  final String? initialValue;
  final TextInputType keyboardType;
  final void Function(String? value)? onSaved;
  final String? Function(String? value)? validator;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<PasscodeTextField> createState() => _PasscodeTextFieldState();
}

class _PasscodeTextFieldState extends State<PasscodeTextField> {
  late final ValueNotifier<bool> obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = ValueNotifier(true);
  }

  @override
  void dispose() {
    obscureText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: obscureText,
      builder: (context, toObscure, _) {
        return CustomTextFormField(
          key: ValueKey(widget.labelName),
          initialValue: widget.initialValue,
          inputFormatters: widget.inputFormatters,
          validator: widget.validator,
          textInputAction: widget.textInputAction,
          obscureText: toObscure,
          keyboardType: widget.keyboardType,
          onSaved: widget.onSaved,
          label: widget.labelName,
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 24),
          prefixIcon: const Icon(
            FeatherIcons.lock,
            size: 16,
          ),
          suffixIcon: MouseRegion(
            onEnter: (_) {
              obscureText.value = false;
            },
            onExit: (_) {
              obscureText.value = true;
            },
            child: IconButton(
              focusNode: FocusNode(skipTraversal: true),
              onPressed: () {
                obscureText.value = !toObscure;
              },
              icon: Icon(
                toObscure ? FeatherIcons.eye : FeatherIcons.eyeOff,
                color: Theme.of(context).iconTheme.color!,
                size: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
