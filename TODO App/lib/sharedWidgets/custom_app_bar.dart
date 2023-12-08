import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< HEAD
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key, this.leading, this.height=25, required this.text, this.actions,
=======
import 'package:intl/intl.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key, this.leading, this.height=25, required this.text,
>>>>>>> origin/main
  });
  @override
  Size get preferredSize =>  Size.fromHeight(100.h);
 final Widget? leading;
 final double height;
 final String text;
<<<<<<< HEAD
 final List<Widget>? actions;
=======
>>>>>>> origin/main
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
<<<<<<< HEAD
      actions: actions,
=======
>>>>>>> origin/main
    );
  }
}