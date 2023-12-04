import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.text,
      this.ontap,
      this.color = const Color(0xff4A3780),
      this.textColor = Colors.white,
      this.width=0})
      : super(key: key);
  final String text;
  final VoidCallback? ontap;
  final Color? color, textColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50.dm),
          ),
          height: 55.h,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 22.sp),
            ),
          ),
        ),
      ),
    );
  }
}
