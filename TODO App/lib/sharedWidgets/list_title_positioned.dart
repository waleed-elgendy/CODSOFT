import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTitlePositioned extends StatelessWidget {
  const ListTitlePositioned({
    super.key, required this.text, required this.lrWidth,
  });
  final String text;
  final double lrWidth;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 96.h,
      left: lrWidth.w,
      right: lrWidth.w,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 35.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    );
  }
}