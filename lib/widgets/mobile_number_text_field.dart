import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../locale/locale.dart';
import 'country_code_icon.dart';
import 'textfields/custom_text_form_field.dart';

class MobileNumberTextField extends StatefulHookConsumerWidget {
  const MobileNumberTextField({
    Key? key,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
  }) : super(key: key);
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String?>? onSaved;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MobileNumberTextFieldState();
}

class _MobileNumberTextFieldState extends ConsumerState<MobileNumberTextField> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // controller.value =
    //     controller.value.copyWith(text: ref.read(recentTripProvider));
    return CustomTextFormField(
      controller: controller,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      keyboardType: TextInputType.number,
      maxLength: 10,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ],
      label: $strings.phoneNumber,
      suffixIcon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              controller.clear();
            },
            child: const Icon(FeatherIcons.xCircle),
          ),
        ],
      ),
      prefixIcon: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: CountryCodeIcon(),
      ),
      hintText: '9928139201',
    );
  }
}
