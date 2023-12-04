import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/sharedWidgets/icon_container.dart';
class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Category",
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          width: 25.w,
        ),
        IconContainer(
          contColor: const Color(0xffDBECF6),
          icon: Icons.list_alt,
          iconColor: const Color(0xff194A66),
          height: 50.h,
          width: 50.w,
        ),
        SizedBox(
          width: 18.w,
        ),
        IconContainer(
          contColor: const Color(0xffE7E2F3),
          icon:  Icons.event,
          iconColor: const Color(0xff4A3780),
          height: 50.h,
          width: 50.w,
        ),
        SizedBox(
          width: 18.w,
        ),
        IconContainer(
          contColor: const Color(0xffFEF5D3),
          icon: Icons.emoji_events_outlined,
          iconColor: const Color(0xff403100),
          height: 50.h,
          width: 50.w,
        ),
      ],
    );
  }
}