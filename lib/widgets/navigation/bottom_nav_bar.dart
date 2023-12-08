import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.destinations,
    this.iconColor,
    this.backgroundColor = const Color(0xFF1C212A),
    required this.onDestinationSelected,
    this.indicatorColor = Colors.white,
  }) : super(key: key);

  final int selectedIndex;
  final Color backgroundColor;
  final ValueChanged<int> onDestinationSelected;
  final List<BottomNavBarDestination> destinations;
  final MaterialStateProperty<Color?>? iconColor;
  final Color indicatorColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, left: 16, right: 16, top: 6),
      child: SafeArea(
        child: Container(
          height: 80,
          decoration: ShapeDecoration(
            color: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 7.0,
                bottom: 7.0,
              ),
              child: Row(
                children: [
                  ...List.generate(
                    destinations.length,
                    (index) => Expanded(
                      child: _BottomNavBarItem(
                        indicatorColor: indicatorColor,
                        onTap: () {
                          HapticFeedback.lightImpact();
                          onDestinationSelected(index);
                        },
                        isSelected: selectedIndex == index,
                        destination: destinations[index],
                        iconColor: iconColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavBarDestination {
  const BottomNavBarDestination({
    required this.icon,
    required this.label,
  });
  final Widget icon;
  final String label;
}

class _BottomNavBarItem extends StatelessWidget {
  const _BottomNavBarItem({
    Key? key,
    required this.indicatorColor,
    required this.onTap,
    required this.isSelected,
    required this.destination,
    this.iconColor,
  }) : super(key: key);

  final bool isSelected;
  final VoidCallback onTap;
  final Color indicatorColor;
  final BottomNavBarDestination destination;
  final MaterialStateProperty<Color?>? iconColor;

  @override
  Widget build(BuildContext context) {
    final Color selectedColor =
        iconColor?.resolve({MaterialState.selected}) ?? Colors.red;
    final Color unSelectedColor = iconColor?.resolve({}) ?? Colors.white;
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: isSelected
                    ? Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: indicatorColor,
                          borderRadius: BorderRadius.circular(7),
                        ),
                      )
                    : const SizedBox.shrink(),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
              ),
              SizedBox.square(
                dimension: 42,
                child: TweenAnimationBuilder<Color?>(
                  duration: const Duration(milliseconds: 300),
                  tween: isSelected
                      ? ColorTween(begin: unSelectedColor, end: selectedColor)
                      : ColorTween(end: unSelectedColor, begin: selectedColor),
                  builder: (context, color, _) {
                    return IconTheme.merge(
                      data: IconThemeData(
                        color: color,
                      ),
                      child: destination.icon,
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            destination.label,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: unSelectedColor,
                ),
          ),
        ],
      ),
    );
  }
}
