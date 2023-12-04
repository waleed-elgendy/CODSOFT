import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PositionedCircle extends StatelessWidget {
  const PositionedCircle({
    super.key,
    this.left,
    this.top,
    this.right,
    this.width,
    this.height,
  });
  final double? left, top, right, width, height;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          shape: CircleBorder(
            side: BorderSide(
              width: 45.w,
              color: const Color(0x14ffffff),
            ),
          ),
        ),
      ),
    );
  }
}
