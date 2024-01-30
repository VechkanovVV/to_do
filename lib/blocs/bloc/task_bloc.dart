import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../modules/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<DeleteTask>(_onDeleteTask);
    on<UpdateTask>(_onUpdateTask);
    on<TopTask>(_onTopTask);
    on<RedTask>(_onRedTask);

  }

  void _onRedTask(RedTask event, Emitter<TaskState> emit){
    final state = this.state;
    final task = event.task;
    final int index = state.tasks.indexOf(task);
    List<Task> tasks = List.from(state.tasks)..remove(task);
    tasks.insert(index, task.copyWith(isRed: true, isGreen: false, isYellow: false));
    emit(TaskState(tasks: tasks));
  }
  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(tasks: List.from(state.tasks)..add(event.task)));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    List<Task> tasks = List.from(state.tasks)..remove(task);
    emit(TaskState(tasks: tasks));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.tasks.indexOf(task);
    List<Task> tasks = List.from(state.tasks)..remove(task);
    task.isDone == false
        ? tasks.insert(index, task.copyWith(isDone: true))
        : tasks.insert(index, task.copyWith(isDone: false));
    emit(TaskState(tasks: tasks));
  }

  void _onTopTask(TopTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.tasks.indexOf(task);
    List<Task> tasks = List.from(state.tasks)..remove(task);
    task.isFavourite == false
        ? tasks.insert(index, task.copyWith(isFavourite: true))
        : tasks.insert(index, task.copyWith(isFavourite: false));
    emit(TaskState(tasks: tasks));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
