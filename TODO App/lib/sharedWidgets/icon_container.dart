import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class IconContainer extends StatelessWidget {
  const IconContainer({
    super.key,
    required this.icon,
    required this.contColor,
    required this.iconColor, required this.isSelected,
  });
  final Color contColor, iconColor;
  final IconData icon;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return isSelected? CircleAvatar(
      radius: 28.dm,
      backgroundColor: const Color(0xffEF7B45),
      child: CircleAvatar(
          backgroundColor: contColor,
         radius: 24.5.dm,
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    ):CircleAvatar(
      backgroundColor: contColor,
      radius: 26.5.dm,
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}