import 'package:flutter/material.dart';

import '../models/energy_source.dart';

class EnergySourceInputSelector extends StatefulWidget {
  const EnergySourceInputSelector({
    Key? key,
    required this.readOnly,
    required this.initialEnergySource,
    required this.onSelected,
  }) : super(key: key);

  final bool readOnly;
  final EnergySource initialEnergySource;
  final ValueChanged<EnergySource> onSelected;

  @override
  State<EnergySourceInputSelector> createState() =>
      _EnergySourceInputSelectorState();
}

class _EnergySourceInputSelectorState extends State<EnergySourceInputSelector> {
  late final ValueNotifier<EnergySource> energySourceNotifier;

  @override
  void initState() {
    super.initState();
    energySourceNotifier = ValueNotifier(widget.initialEnergySource);
  }

  @override
  void dispose() {
    energySourceNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SizedBox(
      height: 56,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...List.generate(
            EnergySource.values.length,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder(
                valueListenable: energySourceNotifier,
                builder: (context, value, _) {
                  bool isSelected = value.index == index;
                  final energySource = EnergySource.values[index];
                  return IgnorePointer(
                    ignoring: widget.readOnly,
                    child: InputChip(
                      showCheckmark: false,
                      labelStyle: const TextStyle(fontSize: 12),
                      selected: isSelected,
                      avatar: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 800),
                        child: isSelected
                            ? Icon(
                                Icons.check_outlined,
                                size: 16,
                                color: isSelected
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.onBackground,
                              )
                            : Icon(
                                energySource.iconData,
                                size: 16,
                                color: isSelected
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.onBackground,
                              ),
                      ),
                      label: Text(
                        energySource.label,
                        style: TextStyle(
                          color: isSelected
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onBackground,
                        ),
                      ),
                      onPressed: () {
                        final selectedEnergySource =
                            EnergySource.values.toList()[index];
                        energySourceNotifier.value = selectedEnergySource;
                        widget.onSelected(selectedEnergySource);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
