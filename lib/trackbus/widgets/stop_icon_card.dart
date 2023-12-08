import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'location_name_card.dart';

class StopIconCard extends StatelessWidget {
  const StopIconCard({
    Key? key,
    required this.stopName,
  }) : super(key: key);
  final String stopName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(FeatherIcons.mapPin),
        ),
        LocationName(locationName: stopName),
      ],
    );
  }
}
