part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> tasks;

  TaskState({
    this.tasks = const <Task>[],
  });

  @override
  List<Object> get props => [tasks];
}

