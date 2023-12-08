import 'package:flutter/material.dart';

/// A normal animatable button specially designed for Third Party Auths.
/// 
class AuthButton extends StatefulWidget {
  const AuthButton({
    Key? key,
    required this.imagePath,
    required this.onTap,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  /// Image path should be the local image path & not the hosted image path.
  /// Image should be a PNG image.
  final String imagePath;

  final VoidCallback onTap;

  /// Background color for the button.
  final Color backgroundColor;

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  double _containerBorderRadius = 12;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _containerBorderRadius = 100;
        });
        widget.onTap();
        setState(() {
          _containerBorderRadius = 12;
        });
      },
      onTapDown: (tapdownDetails) {
        setState(() {
          _containerBorderRadius = 100;
        });
      },
      onTapCancel: () {
        setState(() {
          _containerBorderRadius = 12;
        });
      },
      onLongPressEnd: (end) {
        setState(() {
          _containerBorderRadius = 12;
        });
      },
      child: AnimatedContainer(
        height: 50,
        width: 50,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(_containerBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            widget.imagePath,
          ),
        ),
      ),
    );
  }
}
