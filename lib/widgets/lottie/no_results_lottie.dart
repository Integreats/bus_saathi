import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoResultsLottie extends StatelessWidget {
  const NoResultsLottie({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('images/lottie/no_result.json'),
          Text(message),
        ],
      ),
    );
  }
}
