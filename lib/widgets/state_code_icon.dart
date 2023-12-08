import 'package:flutter/material.dart';

class StateCodeIcon extends StatelessWidget {
  const StateCodeIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'KA',
          style: TextStyle(fontSize: 17),
        ),
      ],
    );
  }
}
