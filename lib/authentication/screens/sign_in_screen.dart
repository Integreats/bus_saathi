import 'package:bus_saathi/l10n/locale.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension_utilities/flutter_extension_utilities.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../responsive_builder.dart';
import '../../widgets/snackbars/error_snackbar.dart';
import '../providers/authentication_controller_provider.dart';
import '../views/sign_in_form_view.dart';

class SignInScreen extends StatefulHookConsumerWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey<ScaffoldState>();

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
      key: scaffoldStateKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:  Text($strings.signIn),
      ),
      body: ResponsiveBuilder(
        small: const SignInFormView(),
        medium: const SignInFormView(),
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
              height: context.sizeOf.height * 0.6,
              child: const SignInFormView(),
            ),
          ),
        ),
      ),
    );
  }
}
