import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:to_do/enums/priority_state.dart';
import '../../modules/task/task.dart';
import '../../repository/task_repository.dart';

part 'task_event.dart';

part 'task_state.dart';

part 'task_bloc.freezed.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository db;
  TaskBloc({required this.db}) : super(const TaskState()) {
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
    on<SetTasks>(_onSetTasks);
  }

  void _onSetTasks(SetTasks event, Emitter<TaskState> emit) async {
    List<Task> list = await db.getTasks();
    emit(TaskState(tasks: list));
  }

  void _onDonePriority(DonePriority event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        tasks: state.tasks.map<Task>((e) {
      if (!(e.isDone)) {
        return e.copyWith(isVisible: false);
      } else {
        return e.copyWith(isVisible: true);
      }
    }).toList()));
  }

  void _onFavouritePriority(FavouritePriority event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        tasks: state.tasks.map<Task>((e) {
      if (!(e.isFavourite)) {
        return e.copyWith(isVisible: false);
      } else {
        return e.copyWith(isVisible: true);
      }
    }).toList()));
  }

  void _onLowPriority(LowPriority event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        tasks: state.tasks.map<Task>((e) {
      if (e.priority != PriorityState.low) {
        return e.copyWith(isVisible: false);
      } else {
        return e.copyWith(isVisible: true);
      }
    }).toList()));
  }

  void _onMediumPriority(MediumPriority event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        tasks: state.tasks.map<Task>((e) {
      if (e.priority != PriorityState.medium) {
        return e.copyWith(isVisible: false);
      } else {
        return e.copyWith(isVisible: true);
      }
    }).toList()));
  }

  void _onInitialOrder(InitialOrder event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        tasks: state.tasks.map<Task>((e) {
      return e.copyWith(isVisible: true);
    }).toList()));
  }

  void _onHighPriority(HighPriority event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        tasks: state.tasks.map<Task>((e) {
      if (e.priority != PriorityState.high) {
        return e.copyWith(isVisible: false);
      } else {
        return e.copyWith(isVisible: true);
      }
    }).toList()));
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) async {
    final state = this.state;
    emit(
      TaskState(
        tasks: List.from(state.tasks)..add(event.task),
      ),
    );
    await db.add(event.task);
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    final state = this.state;
    final task = event.task;
    List<Task> tasks = List.from(state.tasks)..remove(task);
    emit(TaskState(tasks: tasks));
    await db.deleteTask(event.task);
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async {
    final state = this.state;
    final task = event.task;
    final int index = state.tasks.indexOf(task);
    List<Task> tasks = List.from(state.tasks)..remove(task);
    task.isDone == false
        ? tasks.insert(index, task.copyWith(isDone: true))
        : tasks.insert(index, task.copyWith(isDone: false));

    emit(TaskState(tasks: tasks));
    await db.updateTask(tasks[index]);
  }

  void _onTopTask(TopTask event, Emitter<TaskState> emit) async {
    final state = this.state;
    final task = event.task;
    final int index = state.tasks.indexOf(task);
    List<Task> tasks = List.from(state.tasks)..remove(task);
    task.isFavourite == false
        ? tasks.insert(index, task.copyWith(isFavourite: true))
        : tasks.insert(index, task.copyWith(isFavourite: false));
    emit(TaskState(tasks: tasks));
    await db.updateTask(tasks[index]);
  }
}
