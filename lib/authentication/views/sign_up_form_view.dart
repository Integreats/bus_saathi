import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/buttons/elevated_loader_button.dart';
import '../../widgets/textfields/email_textfield.dart';
import '../../widgets/textfields/name_textfield.dart';
import '../../widgets/textfields/password_textfield.dart';
import '../providers/authentication_controller_provider.dart';
import '../providers/sign_up_form_controller.dart';
import '../services/validators.dart';
import '../widgets/buttons/o_auth_buttons.dart';

class SignUpFormView extends StatefulHookConsumerWidget {
  const SignUpFormView({
    super.key,
  });

  @override
  ConsumerState<SignUpFormView> createState() => _SignUpFormViewState();
}

class _SignUpFormViewState extends ConsumerState<SignUpFormView> {
  late final GlobalKey<FormState> signUpFormKey;

  @override
  void initState() {
    super.initState();
    signUpFormKey = ref.read(signUpFormKeyProvider);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final signUpFormNotifier = ref.read(signUpFormControllerProvider.notifier);
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          sliver: SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            sliver: SliverFillRemaining(
              child: Center(
                child: Form(
                  key: signUpFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Good name',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: NameTextField(
                                    label: "First name",
                                    onSaved: (value) {
                                      final firstName = value!.trim();
                                      signUpFormNotifier
                                          .updateFirstName(firstName);
                                    },
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: NameTextField(
                                    label: "Last name",
                                    onSaved: (value) {
                                      final lastName = value!.trim();
                                      signUpFormNotifier
                                          .updateLastName(lastName);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email address',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: EmailTextField(
                              onSaved: (value) {
                                final email = value!.trim();
                                signUpFormNotifier.updateEmail(email);
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Password',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: PasscodeTextField(
                              key: const ValueKey('Password'),
                              labelName: 'Password',
                              onSaved: (String? value) {
                                final password = value!.trim();
                                signUpFormNotifier.updatePassword(password);
                              },
                              textInputAction: TextInputAction.next,
                              validator: Validators.passcodeValidator,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Confirm password',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: PasscodeTextField(
                              key: const ValueKey('Confirm Password'),
                              labelName: 'Confirm password',
                              onSaved: (String? value) {
                                final confirmPassword = value!.trim();
                                signUpFormNotifier
                                    .updateConfirmPassword(confirmPassword);
                              },
                              validator: (confirmPassword) {
                                final password = ref
                                    .read(signUpFormControllerProvider)
                                    .password;

                                return Validators.confirmPasscodeValidator(
                                  password,
                                  confirmPassword,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Consumer(
                              builder: (context, ref, child) {
                                return ElevatedLoaderButton(
                                  isLoading: ref
                                      .watch(authenticationControllerProvider)
                                      .isLoading,
                                  label: const Text('Sign up'),
                                  onPressed: () async {
                                    await ref
                                        .read(authenticationControllerProvider
                                            .notifier)
                                        .signUpWithEmailAndPassword();
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Other ways to sign up',
                              style: theme.textTheme.labelLarge,
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const OAuthsButtons(),
                      const Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
