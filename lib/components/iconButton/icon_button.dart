import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class IconButtonWidget extends StatelessWidget {

  IconButtonWidget({
    this.radius,
    this.icon,
    this.onTap,
});

  final double radius;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child : Material(
        color: Colors.transparent,
        child : InkWell(
          child : Icon(icon),
          onTap: onTap,
        ),
      ),
    );
  }
}
