part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> tasks;
  final Set<String> titles;

  const TaskState({
    this.tasks = const <Task>[],
    this.titles = const {},
  });

  Map<String, dynamic> toMap() {
   return {
     'tasks' : tasks.map((x) => x.toMap()).toList(),
   };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(tasks: List<Task>.from(map['tasks']?.map((x) => Task.fromMap(x))));
  }

  @override
  List<Object> get props => [tasks];
}


