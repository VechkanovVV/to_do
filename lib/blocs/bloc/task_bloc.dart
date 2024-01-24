import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../modules/task.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState()) {
    on<AddTask>(_onAddTask);
    on<DeleteTask>(_onDeleteTask);
    on<UpdateTask>(_onUpdateTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emmit) {
    final state = this.state;
    emit(TaskState(tasks: List.from(state.tasks)..add(event.task)));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emmit) {}

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emmit) {
    final state = this.state;
    final task = event.task;
    final int index = state.tasks.indexOf(task);
    List<Task> tasks = List.from(state.tasks)..remove(task);
    task.isDone == false
        ? tasks.insert(index, task.copyWith(isDone: true))
        : tasks.insert(index, task.copyWith(isDone: false));
    emmit(TaskState(tasks: tasks));
  }
}
