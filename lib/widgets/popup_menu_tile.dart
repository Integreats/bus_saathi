import 'package:flutter/cupertino.dart';

class PopupMenuTile extends StatelessWidget {
  const PopupMenuTile({
    Key? key,
    required this.leadingIconData,
    required this.tileName,
  }) : super(key: key);

  final IconData leadingIconData;
  final String tileName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          leadingIconData,
          size: 18,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(tileName),
      ],
    );
  }
}
