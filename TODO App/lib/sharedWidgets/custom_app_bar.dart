import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key, this.leading, this.height=25, required this.text, this.actions,
  });
  @override
  Size get preferredSize =>  Size.fromHeight(100.h);
 final Widget? leading;
 final double height;
 final String text;
 final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      toolbarHeight: height.h,
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
      actions: actions,
    );
  }
}