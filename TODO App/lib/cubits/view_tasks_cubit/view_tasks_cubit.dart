import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/task_model.dart';

part 'view_tasks_states.dart';

class ViewTasksCubit extends Cubit<ViewTasksStates>{
  ViewTasksCubit() : super(ViewTasksInitial());
  List<TaskModel>newTasks=[],completeTasks=[];
 fetchTasks( String user){
   CollectionReference tasks =
   FirebaseFirestore.instance.collection(user);
   StreamBuilder<QuerySnapshot>(
     stream: tasks.orderBy('createdAt',descending: true).snapshots(),
     builder: (context, snapshot) {
       if(snapshot.hasData)
         {
           for(int i=0;i<snapshot.data!.docs.length;i++)
           {
             newTasks.add(TaskModel.fromjson(snapshot.data!.docs[i]));
             if(newTasks[i].isComplete)
               {
                 completeTasks.add(newTasks[i]);
                 newTasks.remove(newTasks[i]);
               }
           }

         }
       return SizedBox();
     },
   );

 }
}