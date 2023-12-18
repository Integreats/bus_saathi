import 'package:flutter/material.dart';

import '../../l10n/locale.dart';
import '../tile_layout.dart';

class LanguagePickerDialog extends StatefulWidget {
  const LanguagePickerDialog({
    super.key,
    required this.initialLocale,
    required this.onLocaleSelected,
  });

  final Locale initialLocale;
  final ValueChanged<Locale> onLocaleSelected;

  @override
  State<LanguagePickerDialog> createState() => _LanguagePickerDialogState();
}

class _LanguagePickerDialogState extends State<LanguagePickerDialog> {
  final List<String> languagesNamesList = [
    'English',
    'ಕನ್ನಡ',
    'తెలుగు',
  ];
  final List<Locale> languageLocales = const [
    Locale('en'), // English
    Locale('kn'), // Kannada
    Locale('te'), // Telugu
  ];

  late Locale selectedLocale;

  @override
  void initState() {
    super.initState();
    selectedLocale = widget.initialLocale;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text($strings.selectLanguage),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text($strings.done),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...List.generate(
            languagesNamesList.length,
            (index) {
              bool isSelected = selectedLocale == languageLocales[index];
              return TileLayout(
                listTile: ListTile(
                  onTap: () {
                    setState(() {
                      selectedLocale = languageLocales[index];
                    });
                    widget.onLocaleSelected(languageLocales[index]);
                  },
                  selected: isSelected,
                  selectedTileColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.10),
                  title: Text(languagesNamesList[index]),
                  trailing: isSelected
                      ? Icon(
                          Icons.check_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : null,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
