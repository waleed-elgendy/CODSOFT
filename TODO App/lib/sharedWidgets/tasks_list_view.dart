// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/pages/edit_task.dart';
import 'package:todo/sharedWidgets/icon_container.dart';

class TasksListView extends StatefulWidget {
  TasksListView({super.key, required this.tasks, required this.user});
  List<TaskModel> tasks = [];
  String user;

  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  @override
  Widget build(BuildContext context) {
    CollectionReference fTasks =
        FirebaseFirestore.instance.collection(widget.user);
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditTask(user: widget.user, task: widget.tasks[index]),
                ));
          },
          child: Container(
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
              padding: EdgeInsets.only(top: 10.h, right: 12.w, left: 12.w),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Opacity(
                  opacity: widget.tasks[index].isComplete ? 0.65 : 1,
                  //0.65
                  child: IconContainer(
                      icon: IconData(widget.tasks[index].iconCodePoint,
                          fontFamily: 'MaterialIcons',
                          matchTextDirection: true),
                      contColor: Color(widget.tasks[index].conColor),
                      iconColor: Color(widget.tasks[index].iconColor),
                      isSelected: false),
                ),
                title: Opacity(
                  opacity: widget.tasks[index].isComplete ? 0.65 : 1,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    widget.tasks[index].taskTitle,
                    style: TextStyle(
                      fontSize: 18.sp,
                      decoration: widget.tasks[index].isComplete
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      color: widget.tasks[index].isComplete
                          ? Colors.grey
                          : Colors.black,
                    ),
                  ),
                ),
                subtitle: Opacity(
                    opacity: widget.tasks[index].isComplete ? 0.65 : 1,
                    child: subTitle(widget.tasks[index].date,
                        widget.tasks[index].time, index)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        onChanged: (value) async {
                          widget.tasks[index].isComplete =
                              !widget.tasks[index].isComplete;
                          setState(() {});
                          await Future.delayed(
                              const Duration(milliseconds: 250));
                          await fTasks.doc(widget.tasks[index].taskTitle).set({
                            'taskTitle': widget.tasks[index].taskTitle,
                            "iconCodePoint": widget.tasks[index].iconCodePoint,
                            "conColor": widget.tasks[index].conColor,
                            "iconColor": widget.tasks[index].iconColor,
                            "date": widget.tasks[index].date,
                            "time": widget.tasks[index].time,
                            "notes": widget.tasks[index].notes,
                            "isComplete": widget.tasks[index].isComplete,
                            "createdAt": widget.tasks[index].createdAt,
                          });
                        },
                        value: widget.tasks[index].isComplete,
                        side: const BorderSide(
                          color: Color(0xff4A3780),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.dm),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.trash, size: 24.dm),
                      color: const Color(0xff4A3780),
                      onPressed: () async {
                        await fTasks
                            .doc(widget.tasks[index].taskTitle)
                            .delete();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget? subTitle(String? date, time, int index) {
    if (date == null && time != null) {
      return Text(
        time,
        style: TextStyle(
          fontSize: 15.sp,
          decoration: widget.tasks[index].isComplete
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          fontWeight: FontWeight.bold,
          color: widget.tasks[index].isComplete ? Colors.grey : Colors.black,
        ),
      );
    } else if (date != null && time == null) {
      return Text(
        date,
        style: TextStyle(
          fontSize: 15.sp,
          decoration: widget.tasks[index].isComplete
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          fontWeight: FontWeight.bold,
          color: widget.tasks[index].isComplete ? Colors.grey : Colors.black,
        ),
      );
    } else if (date != null && time != null) {
      return Text(
        "$date $time",
        style: TextStyle(
          fontSize: 15.sp,
          decoration: widget.tasks[index].isComplete
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          fontWeight: FontWeight.bold,
          color: widget.tasks[index].isComplete ? Colors.grey : Colors.black,
        ),
      );
    } else {
      return null;
    }
  }
}
