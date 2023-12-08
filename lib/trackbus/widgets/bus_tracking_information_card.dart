import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../themes/custom_colors.dart';
import 'location_name_card.dart';
import 'schedule_timer.dart';
import 'stop_icon_card.dart';

class BusTrackingInformationCard extends StatelessWidget {
  const BusTrackingInformationCard(
      {super.key,
      required this.originLocation,
      required this.destinationLocation,
      required this.currentStop,
      required this.nextStop,
      this.time,
      this.situation});
  final String originLocation;
  final String destinationLocation;
  final String currentStop;
  final String nextStop;
  final String? time;
  final String? situation;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: CustomColors.lightOrange.withOpacity(0.4),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                LocationName(
                  locationName: originLocation,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Icon(FeatherIcons.arrowRight),
                ),
                LocationName(locationName: destinationLocation),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StopIconCard(
                    stopName: currentStop,
                  ),
                  StopIconCard(
                    stopName: nextStop,
                  ),
                ],
              ),
            ),
            ScheduleTimer(
              time: time,
              situation: situation,
            ), //Takes in Time of Delay or Early Arrival,
          ],
        ),
      ],
    );
  }
}
