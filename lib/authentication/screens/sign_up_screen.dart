import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension_utilities/flutter_extension_utilities.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../responsive_builder.dart';
import '../../widgets/snackbars/error_snackbar.dart';
import '../providers/authentication_controller_provider.dart';
import '../views/sign_up_form_view.dart';

class SignUpScreen extends StatefulHookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  @override
  void initState() {
    super.initState();
    ref.listenManual(authenticationControllerProvider, (previous, next) {
      if (!next.isLoading && next.error.runtimeType == FirebaseAuthException) {
        final firebaseError = next.error as FirebaseAuthException;
        ScaffoldMessenger.of(context).showSnackBar(
          ErrorSnackBar(
            message: firebaseError.message ??
                "Something went wrong, please try again later.",
          ).build(context),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: ResponsiveBuilder(
        small: const SignUpFormView(),
        medium: const SignUpFormView(),
        large: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            child: SizedBox(
              width: context.sizeOf.width * 0.5,
              height: context.sizeOf.height * 0.9,
              child: const SignUpFormView(),
            ),
          ),
        ),
      ),
    );
  }
}
