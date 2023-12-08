import 'package:flutter/material.dart';

class LocationName extends StatelessWidget {
  const LocationName({Key? key, required this.locationName}) : super(key: key);
  final String locationName;
  @override
  Widget build(BuildContext context) {
    return Text(
      locationName,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    );
  }
}
