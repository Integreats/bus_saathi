import 'package:bus_saathi/l10n/locale.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/buttons/elevated_loader_button.dart';
import '../../widgets/textfields/email_textfield.dart';
import '../../widgets/textfields/password_textfield.dart';
import '../providers/authentication_controller_provider.dart';
import '../providers/sign_in_form_controller_provider.dart';
import '../widgets/buttons/o_auth_buttons.dart';

class SignInFormView extends StatefulHookConsumerWidget {
  const SignInFormView({
    super.key,
  });

  @override
  ConsumerState<SignInFormView> createState() => _SignInFormViewState();
}

class _SignInFormViewState extends ConsumerState<SignInFormView> {
  late final GlobalKey<FormState> signInFormKey;
  @override
  void initState() {
    super.initState();
    signInFormKey = ref.read(signInFormKeyProvider);
  }

  @override
  Widget build(BuildContext context) {
    final signInFormNotifier = ref.read(signInFormControllerProvider.notifier);

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
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
                  key: signInFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            $strings.emailAddress,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: EmailTextField(
                              onSaved: (value) {
                                signInFormNotifier.updateEmail(value!);
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            $strings.password,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: PasscodeTextField(
                              labelName: $strings.password,
                              onSaved: (value) {
                                signInFormNotifier.updatePassword(value!);
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () async {
                              signInFormKey.currentState!.save();
                              await ref
                                  .read(
                                      authenticationControllerProvider.notifier)
                                  .forgotPassword();
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                    content: Text(
                                      $strings.passwordReset,
                                    ),
                                  ),
                                );
                              }
                            },
                            child:  Text(
                              $strings.forgotPassword,

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
                                  label: Text($strings.signIn),
                                  onPressed: () async {
                                    await ref
                                        .read(authenticationControllerProvider
                                            .notifier)
                                        .signInWithEmailAndPassword();
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
                              $strings.otherSignIn,
                              style: Theme.of(context).textTheme.labelLarge,
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
