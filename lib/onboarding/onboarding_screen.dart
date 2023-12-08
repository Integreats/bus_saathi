import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child:
                        LottieBuilder.asset('animations/security_shield.json'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.lock_outline,
                            size: 24,
                          ),
                          Text(
                            'Secrets? Secured.',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.displaySmall!.copyWith(
                              color: theme.colorScheme.onBackground,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 56,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStatePropertyAll(
                                  theme.colorScheme.onPrimary),
                              backgroundColor: MaterialStatePropertyAll(
                                  theme.colorScheme.primary),
                              shape: const MaterialStatePropertyAll(
                                RoundedRectangleBorder(),
                              ),
                            ),
                            onPressed: () {
                              context.push('/onboarding/signup');
                            },
                            child: const Text('SIGN UP'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              context.go('/onboarding/signin');
                            },
                            style: ButtonStyle(
                              foregroundColor: MaterialStatePropertyAll(
                                  theme.colorScheme.onSecondary),
                              backgroundColor: MaterialStatePropertyAll(
                                  theme.colorScheme.secondary),
                              shape: const MaterialStatePropertyAll(
                                RoundedRectangleBorder(),
                              ),
                            ),
                            child: const Text('SIGN IN'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
