import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final double? iconSize;

  final IconData icon;

  final double buttonSize;

  final VoidCallback? onPressed;

  final Color? primaryColor;

  final Color? onPrimaryColor;

  const CircleButton({
    Key? key,
    this.onPressed,
    required this.icon,
    this.primaryColor,
    this.onPrimaryColor,
    this.iconSize = 50,
    this.buttonSize = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(icon, size: iconSize),
      style: ElevatedButton.styleFrom(
          primary: primaryColor,
          onPrimary: onPrimaryColor,
          fixedSize: Size(buttonSize, buttonSize),
          shape: CircleBorder()),
    );
  }
}
