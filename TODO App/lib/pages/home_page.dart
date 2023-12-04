// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/helper/get_two_lists.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/pages/complete_tasks_only_paga.dart';
import 'package:todo/pages/new&complete_tasks_page.dart';
import 'package:todo/pages/new_tasks_only_page.dart';
import 'package:todo/pages/no_data_page.dart';
import 'package:todo/pages/no_tasks_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.user}) : super(key: key);
  String user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    CollectionReference tasks =
        FirebaseFirestore.instance.collection(widget.user);
    return StreamBuilder<QuerySnapshot>(
      stream: tasks.orderBy('createdAt', descending: false).snapshots(),
      builder: (context, snapshot) {
        List<TaskModel> allTasks = [], newTasks = [], completeTasks = [];
        if (snapshot.hasData) {
          getTwoTasksLists(
            snapshot,
            allTasks,
            completeTasks,
            newTasks,
          );
          if (newTasks.isNotEmpty && completeTasks.isEmpty) {
            //new tasks only
            return NewTasksOnlyPage(
              user: widget.user,
              newTasks: newTasks,
              completeTasks: completeTasks,
            );
          } else if (newTasks.isNotEmpty && completeTasks.isNotEmpty) {
            //new and complete tasks
            return NewAndCompleteTasksPage(
              user: widget.user,
              newTasks: newTasks,
              completeTasks: completeTasks,
            );
          } else if (newTasks.isEmpty && completeTasks.isNotEmpty) {
            //complete task only
            return CompleteTasksOnlyPaga(
              user: widget.user,
              newTasks: newTasks,
              completeTasks: completeTasks,
            );
          } else {
            //no tasks in the allTasks list
            return NoTasksPage(user: widget.user);
          }
        } else {
          return const NoDataPage();
        }
      },
    );
  }




}
