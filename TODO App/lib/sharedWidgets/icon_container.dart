import 'package:flutter/material.dart';
class IconContainer extends StatelessWidget {
  const IconContainer({
    super.key,
    this.width,
    this.height,
    required this.icon,
    required this.contColor,
    required this.iconColor,
  });
  final double? width, height;
  final Color contColor, iconColor;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: contColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}