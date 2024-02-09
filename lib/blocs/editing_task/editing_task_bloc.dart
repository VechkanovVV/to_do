import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'editing_task_bloc.freezed.dart';

part 'editing_task_event.dart';

part 'editing_task_state.dart';

class EditingTaskBloc extends Bloc<EditingTaskEvent, EditingTaskState> {
  EditingTaskBloc() : super(const EditingTaskState()) {
    on<EditingTaskEvent>((event, emit) {
      on<SetHighPriorityEvent>(_onHighPriority);
      on<SetMediumPriorityEvent>(_onMediumPriority);
      on<SetLowPriorityEvent>(_onLowPriority);
      on<SetTitleEvent>(_onTitleEvent);
    });
  }

  void _onTitleEvent(SetTitleEvent event, Emitter<EditingTaskState> emit) {
    final newString = event.text;
    final newState = state.copyWith(title: newString);
    emit(newState);
  }

  void _onLowPriority(
      SetLowPriorityEvent event, Emitter<EditingTaskState> emit) {
    final EditingTaskState newState;
    if (!state.isGreen) {
      newState = state.copyWith(isGreen: true, isRed: false, isYellow: false);
    } else {
      newState = state.copyWith(isGreen: false, isRed: false, isYellow: false);
    }
    emit(newState);
  }

  void _onMediumPriority(
      SetMediumPriorityEvent event, Emitter<EditingTaskState> emit) {
    final EditingTaskState newState;
    if (!state.isYellow) {
      newState = state.copyWith(isRed: false, isYellow: true, isGreen: false);
    } else {
      newState = state.copyWith(isRed: false, isGreen: false, isYellow: false);
    }
    emit(newState);
  }

  void _onHighPriority(SetHighPriorityEvent event, Emitter<EditingTaskState> emit) {
    final EditingTaskState newState;
    if (!state.isRed) {
      newState = state.copyWith(isRed: true, isGreen: false, isYellow: false);
    } else {
      newState = state.copyWith(isRed: false, isGreen: false, isYellow: false);
    }
    emit(newState);
  }
}
