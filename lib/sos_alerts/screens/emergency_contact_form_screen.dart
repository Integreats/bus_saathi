import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/locale.dart';
import '../../models/form_type.dart';
import '../../widgets/buttons/elevated_loader_button.dart';
import '../../widgets/form_tile.dart';
import '../../widgets/popups/show_discard_changes_popup.dart';
import '../../widgets/snackbars/show_successful_snackbar.dart';
import '../../widgets/textfields/email_textfield.dart';
import '../../widgets/textfields/full_name_text_field.dart';
import '../../widgets/textfields/phone_number_text_field.dart';
import '../models/emergency_contact.dart';
import '../providers/emergency_contacts_form_controller_provider.dart';
import '../repositories/sos_repository.dart';

final emergencyContactFormKeyProvider =
    Provider.autoDispose<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>(debugLabel: 'emergencyContactFormKey');
});

class EmergencyContactFormScreen extends StatefulWidget {
  const EmergencyContactFormScreen({
    super.key,
    required this.emergencyContactFormType,
    required this.emergencyContact,
  });

  final EmergencyContact emergencyContact;

  final FormType emergencyContactFormType;

  @override
  State<EmergencyContactFormScreen> createState() =>
      _EmergencyContactFormScreenState();
}

class _EmergencyContactFormScreenState
    extends State<EmergencyContactFormScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        emergencyContactFormControllerProvider
            .overrideWith(() => EmergencyContactFormNotifier(
                  initialEmergencyContact: widget.emergencyContact,
                )),
      ],
      child: EmergencyContactForm(
        emergencyContact: widget.emergencyContact,
        emergencyContactFormType: widget.emergencyContactFormType,
      ),
    );
  }
}

class EmergencyContactForm extends ConsumerStatefulWidget {
  const EmergencyContactForm({
    super.key,
    required this.emergencyContact,
    required this.emergencyContactFormType,
  });

  final EmergencyContact emergencyContact;
  final FormType emergencyContactFormType;

  @override
  ConsumerState<EmergencyContactForm> createState() =>
      _EmergencyContactFormState();
}

class _EmergencyContactFormState extends ConsumerState<EmergencyContactForm> {
  late final bool readOnly;

  @override
  void initState() {
    super.initState();
    readOnly = widget.emergencyContactFormType == FormType.read ? true : false;
  }

  String appBarTitle() {
    String appBarTitle;
    switch (widget.emergencyContactFormType) {
      case FormType.create:
        appBarTitle = $strings.newEmergencyContact;
        break;
      case FormType.read:
        appBarTitle = $strings.emergencyContact;
        break;
      case FormType.edit:
        appBarTitle = $strings.editEmergencyContact;
        break;
      default:
        appBarTitle = $strings.emergencyContact;
    }
    return appBarTitle;
  }

  Widget buildButtonLabel() {
    FormType formType = widget.emergencyContactFormType;

    switch (formType) {
      case FormType.create:
        return Text($strings.addEmergencyContact);
      case FormType.read:
        return Text($strings.editEmergencyContact);
      case FormType.edit:
        return Text($strings.saveEmergencyContact);
      default:
        return Text($strings.saveEmergencyContact);
    }
  }

  @override
  Widget build(BuildContext context) {
    final initialEmergencyContact =
        ref.read(emergencyContactFormControllerProvider);
    final formKey = ref.watch(emergencyContactFormKeyProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false, // this is new
      body: Form(
        key: readOnly ? null : formKey,
        onWillPop: () async {
          if (readOnly) return true;
          formKey.currentState!.save();
          if (widget.emergencyContact == initialEmergencyContact) {
            return Future.value(true);
          } else {
            bool toGoBack = false;
            await showDiscardChangesPopup(context, onConfirmDiscard: () {
              toGoBack = true;
            });
            return Future.value(toGoBack);
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar.medium(
                    title: Text(
                      appBarTitle(),
                    ),
                    actions: [
                      widget.emergencyContactFormType != FormType.create
                          ? IconButton(
                              onPressed: () async {
                                final emergencyContact = ref.read(
                                    emergencyContactFormControllerProvider);
                                await ref
                                    .read(sosRepositoryProvider)
                                    .deleteEmergencyContact(emergencyContact);

                                if (!mounted) return;
                                context.pop();
                                showSuccessSnackbar(
                                  context,
                                  title: $strings.emergencyContactRemoved,
                                  message:
                                      'Successfully removed ${emergencyContact.name} as EmergencyContact!',
                                );
                              },
                              icon: const Icon(Icons.delete_outline_rounded),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          const SizedBox(
                            height: 8,
                          ),
                          FormTile(
                            header: $strings.fullName,
                            icon: const Icon(FeatherIcons.user),
                            textField: FullNameTextField(
                              key: const ValueKey('full_name'),
                              readOnly: readOnly,
                              autoFocus: widget.emergencyContactFormType ==
                                      FormType.read
                                  ? false
                                  : true,
                              initialValue: initialEmergencyContact.name,
                              onChanged: ref
                                  .read(emergencyContactFormControllerProvider
                                      .notifier)
                                  .updateName,
                            ),
                          ),
                          FormTile(
                            header: $strings.phoneNumber,
                            icon: const Icon(FeatherIcons.phone),
                            textField: PhoneNumberTextField(
                              key: const ValueKey('phone_number'),
                              initialValue: initialEmergencyContact
                                          .phoneNumber ==
                                      0
                                  ? ""
                                  : ref
                                      .read(
                                          emergencyContactFormControllerProvider)
                                      .phoneNumber
                                      .toString(),
                              readOnly: readOnly,
                              onChanged: ref
                                  .read(emergencyContactFormControllerProvider
                                      .notifier)
                                  .updatePhoneNumber,
                            ),
                          ),
                          FormTile(
                            header: $strings.emailAddress,
                            icon: const Icon(FeatherIcons.mail),
                            textField: EmailTextField(
                              key: const ValueKey('email_address'),
                              initialValue: ref
                                  .read(emergencyContactFormControllerProvider)
                                  .emailAddress,
                              readOnly: readOnly,
                              onChanged: ref
                                  .read(emergencyContactFormControllerProvider
                                      .notifier)
                                  .updateEmailAddress,
                            ),
                          ),
                          const Gap(16),
                          const SizedBox(
                            height: 64,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: ElevatedLoaderButton(
                          label: buildButtonLabel(),
                          checkConnectivity: true,
                          onPressed: onPressed,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    FocusScope.of(context).unfocus();
    final emergencyContact = ref.read(emergencyContactFormControllerProvider);

    final isSuccess = await ref
        .read(emergencyContactFormControllerProvider.notifier)
        .save(widget.emergencyContactFormType);
    if (!mounted) return;

    switch (widget.emergencyContactFormType) {
      case FormType.create:
        if (isSuccess) {
          showSuccessSnackbar(
            context,
            title: $strings.emergencyContactAdded,
            message:
                'Successfully added ${emergencyContact.name} as EmergencyContact!',
          );
        }
        break;
      case FormType.edit:
        if (isSuccess) {
          showSuccessSnackbar(
            context,
            title: $strings.updateSuccessful,
            message: 'Successfully Updated ${emergencyContact.name} !',
          );
        }
        break;
      default:
    }
  }
}
