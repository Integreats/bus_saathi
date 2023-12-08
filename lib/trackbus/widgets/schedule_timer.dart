import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

///It produces the timer which helps user understand whether the bus is on time
///[String] time takes in the duration in mins
///[String] situation takes in early or delay in time
///If none provided it returns On Time Widget
class ScheduleTimer extends StatelessWidget {
  const ScheduleTimer({
    Key? key,
    this.time,
    this.situation,
  }) : super(key: key);
  final String? time;
  final String? situation;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                FeatherIcons.clock,
                size: 45,
              ),
            ),
            time == null
                ? const Text(
                    "On Time",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : Column(
                    children:  [
                      Text(
                        "$time mins",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        situation?? "Delay",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  )
          ],
        )
      ],
    );
  }
}
