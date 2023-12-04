import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:todo/pages/addTask_page.dart';
import 'package:todo/sharedWidgets/custom_button.dart';
//EF7B45 F3C969 804a37

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:AppBar(
        toolbarHeight: 25,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          DateFormat('MMMM d, y').format(DateTime.now()),
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Stack(
        children: [
          const Positioned(
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Positioned(
            child: Container(
              color: const Color(0xff4A3780),
              width: double.infinity,
              height: 222.h,
            ),
          ),
          Positioned(
            left: -140.w,
            top: 55.h,
            child: Container(
              width: 280.w,
              height: 300.h,
              decoration: ShapeDecoration(
                shape: CircleBorder(
                  side: BorderSide(
                    width: 50.w,
                    color: const Color(0x14ffffff),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: -110.w,
            top: -45.h,
            child: Container(
              width: 180.w,
              height: 180.h,
              decoration: ShapeDecoration(
                shape: CircleBorder(
                  side: BorderSide(
                    width: 37.w,
                    color: const Color(0x12ffffff),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 96.h,
            left: 107.w,
            child: Text(
              'My Todo List',
              style: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: 158.h,
            left: 20.w,
            right: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5.dm),
                  height: 328.h,
                  //560.h ,,, 328.h
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.dm)),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 360.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom: BorderSide(
                            color: Colors.grey.shade300,
                          )),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 10.h, right: 12.w, left: 12.w),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: const Color(0xffE7E2F3),
                                borderRadius: BorderRadius.circular(50.dm),
                              ),
                              child: const Icon(
                                FontAwesomeIcons.calendarDay,
                                color: Color(0xff4A3780),
                              ),
                            ),
                            title: Text(
                              "Study Lesson",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: null,
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Transform.scale(
                                  scale: 1.5,
                                  child: Checkbox(
                                    onChanged: (value) => {},
                                    value: false,
                                    side: const BorderSide(
                                      color: Color(0xff4A3780),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.dm),
                                    ),
                                  ),
                                ),
                                Icon(
                                  FontAwesomeIcons.trash,
                                  color: const Color(0xff4A3780),
                                  size: 24.dm,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  "Completed",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Container(
                  padding: EdgeInsets.all(5.dm),
                  height: 160.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.dm)),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 360.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom: BorderSide(
                            color: Colors.grey.shade300,
                          )),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 10.h, right: 12.w, left: 12.w),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Opacity(
                              opacity: 0.65,
                              child: Container(
                                width: 50.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xffE7E2F3),
                                  borderRadius: BorderRadius.circular(50.dm),
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.calendarDay,
                                  color: Color(0xff4A3780),
                                ),
                              ),
                            ),
                            title: Opacity(
                              opacity: 0.65,
                              child: Text(
                                "Study Lesson",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            subtitle: null,
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Transform.scale(
                                  scale: 1.5,
                                  child: Checkbox(
                                    onChanged: (value) => {},
                                    value: true,
                                    side: const BorderSide(
                                      color: Color(0xff4A3780),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.dm),
                                    ),
                                  ),
                                ),
                                Icon(
                                  FontAwesomeIcons.trash,
                                  color: const Color(0xff4A3780),
                                  size: 24.dm,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                CustomButton(
                  text: "Add New Task",
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddTask(),
                      ),
                    );
                  }, color: const Color(0xff4A3780),
                )
              ],
            ),
          ),
          /*Positioned(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
            child: CustomButton(text: "Add New Task"),
          )*/
        ],
      ),
    );
  }
}
