part of 'view_tasks_cubit.dart';

class ViewTasksStates {}

class ViewTasksInitial extends ViewTasksStates {}

class ViewTasksLoading extends ViewTasksStates {}

class ViewTasksSuccess extends ViewTasksStates {}

class NoCompleteTasks extends ViewTasksStates{}

class HaveCompleteTasks extends ViewTasksStates{}

class ViewTasksFailure extends ViewTasksStates {
  final String errorMessage;

  ViewTasksFailure(this.errorMessage);
}
