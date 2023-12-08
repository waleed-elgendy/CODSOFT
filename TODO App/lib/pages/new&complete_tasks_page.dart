import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/pages/addTask_page.dart';
import 'package:todo/sharedWidgets/custom_app_bar.dart';
import 'package:todo/sharedWidgets/custom_button.dart';
import 'package:todo/sharedWidgets/first_two_positioned.dart';
import 'package:todo/sharedWidgets/list_container.dart';
import 'package:todo/sharedWidgets/list_title_positioned.dart';

class NewAndCompleteTasksPage extends StatelessWidget {
  const NewAndCompleteTasksPage({
    super.key,
    required this.user,
    required this.newTasks,
    required this.completeTasks,
  });

  final String user;
  final List<TaskModel> newTasks, completeTasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(text: DateFormat('MMMM d, y').format(DateTime.now())),
      body: Stack(
        children: [
          const FirstPositioned(),
          const MainColorContainer(),
          PositionedCircle(
              right: -110.w, top: -45.h, width: 180.w, height: 180.h),
          PositionedCircle(
              left: -140.w, top: 55.h, width: 280.w, height: 300.h),
          ListTitlePositioned(text: 'My Todo List', lrWidth: 104.w),
          Positioned(
            top: 158.h,
            left: 20.w,
            right: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListContainer(
                  height: 328.h,
                  tasks: newTasks,
                  user: user,
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
                ListContainer(
                  height: 160.h,
                  tasks: completeTasks,
                  user: user,
                ),
                SizedBox(
                  height: 67.h,
                ),
                CustomButton(
                  text: "Add New Task",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddTask(
                          user: user,
                        ),
                      ),
                    );
                  },
                  color: const Color(0xff4A3780),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
