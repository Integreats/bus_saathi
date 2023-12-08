import 'package:flutter/material.dart';

class CountryCodeIcon extends StatelessWidget {
  const CountryCodeIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '+91',
          style: TextStyle(fontSize: 17),
        ),
      ],
    );
  }
}
