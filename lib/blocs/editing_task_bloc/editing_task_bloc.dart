import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:to_do/enums/priority_state.dart';

part 'editing_task_bloc.freezed.dart';

part 'editing_task_event.dart';

part 'editing_task_state.dart';

class EditingTaskBloc extends Bloc<EditingTaskEvent, EditingTaskState> {
  EditingTaskBloc() : super(const EditingTaskState()) {
    on<SetHighPriorityEvent>(_onHighPriority);
    on<SetMediumPriorityEvent>(_onMediumPriority);
    on<SetLowPriorityEvent>(_onLowPriority);
    on<SetTitleEvent>(_onTitleEvent);
  }

  void _onTitleEvent(SetTitleEvent event, Emitter<EditingTaskState> emit) {
    final newString = event.text;
    final newState = state.copyWith(title: newString);
    emit(newState);
  }

  void _onLowPriority(
      SetLowPriorityEvent event, Emitter<EditingTaskState> emit) {
    final EditingTaskState newState;
    if (state.priority != PriorityState.low) {
      newState = state.copyWith(priority: PriorityState.low);
    } else {
      newState = state.copyWith(priority: PriorityState.none);
    }
    emit(newState);
  }

  void _onMediumPriority(
      SetMediumPriorityEvent event, Emitter<EditingTaskState> emit) {
    final EditingTaskState newState;
    if (state.priority != PriorityState.medium) {
      newState = state.copyWith(priority: PriorityState.medium);
    } else {
      newState = state.copyWith(priority: PriorityState.none);
    }
    emit(newState);
  }

  void _onHighPriority(
      SetHighPriorityEvent event, Emitter<EditingTaskState> emit) {
    final EditingTaskState newState;
    if (state.priority != PriorityState.high) {
      newState = state.copyWith(priority: PriorityState.high);
    } else {
      newState = state.copyWith(priority: PriorityState.none);
    }
    emit(newState);
  }
}