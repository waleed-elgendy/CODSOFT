import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

<<<<<<< HEAD

=======
>>>>>>> origin/main
class FirstPositioned extends StatelessWidget {
  const FirstPositioned({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        color: const Color(0xffF1F5F9),
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}

<<<<<<< HEAD

class MainColorContainer extends StatelessWidget {
  const MainColorContainer({
    super.key,
    this.height = 222,
=======
class MainColorContainer extends StatelessWidget {
  const MainColorContainer({
    super.key, this.height = 222,
>>>>>>> origin/main
  });
  final double height;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        color: const Color(0xff4A3780),
        width: double.infinity,
        height: height.h,
      ),
    );
  }
}

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
<<<<<<< HEAD
=======

>>>>>>> origin/main
