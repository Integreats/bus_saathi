import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../l10n/locale.dart';
import '../../services/phone_number_formatter_service.dart';
import '../../widgets/popup_menu_tile.dart';
import '../models/emergency_contact.dart';
import '../models/emergency_contact_menu_options.dart';

class EmergencyContactListTile extends StatelessWidget {
  const EmergencyContactListTile({
    Key? key,
    required this.emergencyContact,
    required this.onTap,
    required this.onMenuOptionSelected,
  }) : super(key: key);

  final EmergencyContact emergencyContact;
  final VoidCallback? onTap;
  final ValueChanged<EmergencyContactMenuOptions> onMenuOptionSelected;

  @override
  Widget build(BuildContext context) {
    final String formattedPhoneNumber =
        PhoneNumberFormatterService.formatIndiaPhoneNumber(
      emergencyContact.phoneNumber,
    );
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            child: ListTile(
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.zero,
              leading: Builder(
                builder: (context) {
                  return CircleAvatar(
                    radius: 22,
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.15),
                    child: Text(
                      emergencyContact.name.substring(0, 1),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  );
                },
              ),
              title: Text(
                emergencyContact.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Wrap(
                children: [
                  Text(
                    formattedPhoneNumber,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  Text(
                    emergencyContact.emailAddress,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
              trailing: PopupMenuButton<EmergencyContactMenuOptions>(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                onSelected: onMenuOptionSelected,
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: EmergencyContactMenuOptions.edit,
                      child: PopupMenuTile(
                        leadingIconData: FeatherIcons.edit3,
                        tileName: $strings.edit,
                      ),
                    ),
                    PopupMenuItem(
                      value: EmergencyContactMenuOptions.remove,
                      child: PopupMenuTile(
                        leadingIconData: FeatherIcons.userX,
                        tileName: $strings.remove,
                      ),
                    ),
                  ];
                },
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 0.05,
          ),
        ],
      ),
    );
  }
}
