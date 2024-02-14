part of 'editing_task_bloc.dart';

class EditingTaskEvent {}

class SetHighPriorityEvent extends EditingTaskEvent {}

class SetMediumPriorityEvent extends EditingTaskEvent {}

class SetLowPriorityEvent extends EditingTaskEvent {}

class SetTitleEvent extends EditingTaskEvent {
  final String text;

  SetTitleEvent(this.text);
}
