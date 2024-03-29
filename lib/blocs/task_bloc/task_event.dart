part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;

  const AddTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class UpdateTask extends TaskEvent {
  final Task task;

  const UpdateTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TaskEvent {
  final Task task;

  const DeleteTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class TopTask extends TaskEvent {
  final Task task;

  const TopTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class HighPriority extends TaskEvent {
  const HighPriority();
}

class InitialOrder extends TaskEvent {
  const InitialOrder();
}

class MediumPriority extends TaskEvent {
  const MediumPriority();
}

class LowPriority extends TaskEvent {
  const LowPriority();
}

class FavouritePriority extends TaskEvent {
  const FavouritePriority();
}

class DonePriority extends TaskEvent {
  const DonePriority();
}

class SetTasks extends TaskEvent {
  const SetTasks();
}

class EditTask extends TaskEvent {
  final Task task1;
  final Task task2;
  const EditTask({required this.task1, required this.task2});
}
