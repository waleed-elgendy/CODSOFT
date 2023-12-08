import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';

void getTwoTasksLists(
    AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
    List<TaskModel> allTasks,
    completeTasks,
    newTasks,
    ) {
  for (int i = 0; i < snapshot.data!.docs.length; i++) {
    allTasks.add(TaskModel.fromjson(snapshot.data!.docs[i]));
    if (allTasks[i].isComplete) {
      completeTasks.add(allTasks[i]);
    } else {
      newTasks.add(allTasks[i]);
    }
  }
}