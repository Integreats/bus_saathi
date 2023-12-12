import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('images/lottie/loading.json'),
        ],
      ),
    );
  }
}
