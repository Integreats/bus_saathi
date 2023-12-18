import 'package:flutter/material.dart';

import '../../l10n/locale.dart';

class EmergencyContactsScreen extends StatelessWidget {
  const EmergencyContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text($strings.emergencyContacts),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
