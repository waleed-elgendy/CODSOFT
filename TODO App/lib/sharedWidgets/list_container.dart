import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/sharedWidgets/tasks_list_view.dart';

class ListContainer extends StatelessWidget {
  const ListContainer({
    super.key, required this.height,required this.tasks, required this.user
  });
  final double height;
  final List<TaskModel> tasks;
  final  String user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.dm),
      height: height.h,
      //560.h ,,, 328.h ,,, 160.h
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.dm)),
      child: TasksListView(tasks: tasks,user: user),
    );
  }
}