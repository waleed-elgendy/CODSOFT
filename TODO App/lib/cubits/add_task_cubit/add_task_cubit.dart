import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/task_model.dart';
part 'add_task_states.dart';

class AddTaskCubit extends Cubit<AddTaskStates> {
  AddTaskCubit() : super(AddTaskInitial());

  int iconCodePoint = 0xe385, iconColor = 0xff194A66, conColor = 0xffDBECF6;
  addTask(TaskModel task, String taskTitle, String user) async {
    task.iconCodePoint = iconCodePoint;
    task.iconColor = iconColor;
    task.conColor = conColor;
    emit(AddTaskLoading());
    try {
      CollectionReference tasks = FirebaseFirestore.instance.collection(user);
     await tasks.doc(taskTitle).set({
        'taskTitle': task.taskTitle,
        "iconCodePoint": task.iconCodePoint,
        "conColor": task.conColor,
        "iconColor": task.iconColor,
        "date": task.date,
        "time": task.time,
        "notes": task.notes,
        "isComplete": task.isComplete,
        "createdAt":DateTime.now(),
      });
      emit(AddTaskSuccess());
    } catch (e) {
      emit(AddTaskFailure(e.toString()));
    }
  }
}
