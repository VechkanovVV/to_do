import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../enums/sort_label.dart';
import '../../modules/task.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<DeleteTask>(_onDeleteTask);
    on<UpdateTask>(_onUpdateTask);
    on<TopTask>(_onTopTask);
    on<HighPriority>(_onHighPriority);
    on<InitialOrder>(_onInitialOrder);
    on<MediumPriority>(_onMediumPriority);
    on<LowPriority>(_onLowPriority);
    on<FavouritePriority>(_onFavouritePriority);
    on<DonePriority>(_onDonePriority);
  }

  void _onDonePriority(DonePriority event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        tasks: state.tasks.map<Task>((e) {
      if (!(e.isDone ?? false)) e.isVisible = false;
      return e;
    }).toList()));
  }

  void _onFavouritePriority(FavouritePriority event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        tasks: state.tasks.map<Task>((e) {
      if (!(e.isFavourite ?? false)) {
        e.isVisible = false;
      } else {
        e.isVisible = true;
      }
      return e;
    }).toList()));
  }

  void _onLowPriority(LowPriority event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        tasks: state.tasks.map<Task>((e) {
      if (!(e.isGreen ?? false)) {
        e.isVisible = false;
      } else {
        e.isVisible = true;
      }
      return e;
    }).toList()));
  }

  void _onMediumPriority(MediumPriority event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        tasks: state.tasks.map<Task>((e) {
      if (!(e.isYellow ?? false)) {
        e.isVisible = false;
      } else {
        e.isVisible = true;
      }
      return e;
    }).toList()));
  }

  void _onInitialOrder(InitialOrder event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        tasks: state.tasks.map<Task>((e) {
      e.isVisible = true;
      return e;
    }).toList()));
  }

  void _onHighPriority(HighPriority event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        tasks: state.tasks.map<Task>((e) {
      if (!(e.isRed ?? false)) {
        e.isVisible = false;
      } else {
        e.isVisible = true;
      }
      return e;
    }).toList()));
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        tasks: List.from(state.tasks)..add(event.task),
        titles: Set.from(state.titles)..add(event.task.title)));
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
