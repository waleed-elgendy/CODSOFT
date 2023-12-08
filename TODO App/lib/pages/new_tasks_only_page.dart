// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/pages/addTask_page.dart';
import 'package:todo/pages/login_page.dart';
import 'package:todo/sharedWidgets/custom_app_bar.dart';
import 'package:todo/sharedWidgets/custom_button.dart';
import 'package:todo/sharedWidgets/first_two_positioned.dart';
import 'package:todo/sharedWidgets/icon_container.dart';
import 'package:todo/sharedWidgets/list_container.dart';
import 'package:todo/sharedWidgets/list_title_positioned.dart';

class NewTasksOnlyPage extends StatelessWidget {
  const NewTasksOnlyPage({
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
      appBar: CustomAppBar(
          height: 35,
          text: DateFormat('MMMM d, y').format(DateTime.now()),
          actions: [
            GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                await SharedPreferences.getInstance().then((sharedPrefValue) {
                  sharedPrefValue.remove('token');
                });
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                    (route) => false);
              },
              child: const IconContainer(
                  icon: Icons.logout_sharp,
                  contColor: Colors.white,
                  iconColor: Color(0xff4A3780),
                  isSelected: false),
            ),
          ]),
      body: Stack(
        children: [
          const FirstPositioned(),
          const MainColorContainer(),
          //const LogOut(),
          PositionedCircle(
              right: -110.w, top: -45.h, width: 180.w, height: 180.h),
          PositionedCircle(
              left: -140.w, top: 55.h, width: 280.w, height: 300.h),
          ListTitlePositioned(text: 'My Todo List', lrWidth: 102.w),
          Positioned(
            top: 158.h,
            left: 20.w,
            right: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListContainer(
                  height: 560.h,
                  tasks: newTasks,
                  user: user,
                ),
                SizedBox(
                  height: 40.h,
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
