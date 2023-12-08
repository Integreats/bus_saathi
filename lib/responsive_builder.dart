import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    this.small,
    this.medium,
    this.large,
  });

  /// Example: Mobile
  final Widget? small;

  /// Example: Tablets
  final Widget? medium;

  /// Example: Laptops, PCs, TV, etc.
  final Widget? large;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (size.width < 600) {
      return small ?? const SizedBox.shrink();
    } else if (size.width < 1200 && size.width >= 600) {
      return medium ?? const SizedBox.shrink();
    } else {
      return large ?? const SizedBox.shrink();
    }
  }
}
