import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../l10n/locale.dart';

class ThemeTabBar extends StatefulWidget {
  const ThemeTabBar({
    Key? key,
    required this.initialThemeMode,
    required this.onChanged,
  }) : super(key: key);

  final ThemeMode initialThemeMode;

  final void Function(ThemeMode selectedThemeMode) onChanged;

  @override
  State<ThemeTabBar> createState() => _ThemeTabBarState();
}

class _ThemeTabBarState extends State<ThemeTabBar>
    with TickerProviderStateMixin {
  late ThemeMode currentThemeMode;
  late TabController controller;

  @override
  void initState() {
    super.initState();

    currentThemeMode = widget.initialThemeMode;
    controller = TabController(
      initialIndex: currentThemeMode.index,
      length: 3,
      animationDuration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 4,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                TabBar(
                  controller: controller,
                  onTap: (int index) {
                    currentThemeMode = ThemeMode.values[index];
                    controller.animateTo(
                      index,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    );
                    widget.onChanged(ThemeMode.values[index]);
                  },
                  dividerColor: Colors.transparent,
                  indicatorWeight: 0,
                  indicator: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    _CustomTab(
                      label: $strings.device,
                      icon: UniconsLine.mobile_android,
                      isSelected: currentThemeMode == ThemeMode.system,
                    ),
                    _CustomTab(
                      label: $strings.light,
                      icon: UniconsLine.sun,
                      isSelected: currentThemeMode == ThemeMode.light,
                    ),
                    _CustomTab(
                      label: $strings.dark,
                      icon: UniconsLine.moon,
                      isSelected: currentThemeMode == ThemeMode.dark,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomTab extends StatelessWidget {
  const _CustomTab({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
  }) : super(key: key);
  final IconData icon;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onBackground,
          ),
          const SizedBox(
            width: 1,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );
  }
}
