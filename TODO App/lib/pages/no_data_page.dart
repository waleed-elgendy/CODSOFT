import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo/sharedWidgets/custom_app_bar.dart';
import 'package:todo/sharedWidgets/first_two_positioned.dart';
class NoDataPage extends StatelessWidget {
  const NoDataPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(text: DateFormat('MMMM d, y').format(DateTime.now())),
      body: Stack(
        children: [
          const Positioned(
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          const FirstPositioned(),
          const MainColorContainer(),
          PositionedCircle(
              right: -110.w, top: -45.h, width: 180.w, height: 180.h),
          PositionedCircle(
              left: -140.w, top: 55.h, width: 280.w, height: 300.h),
          Positioned(
            top: 420.h,
            left: 190,
            child: const CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
