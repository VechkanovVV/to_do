import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../modules/task.dart';

part 'editing_task_event.dart';
part 'editing_task_state.dart';

class EditingTaskBloc extends Bloc<EditingTaskEvent, EditingTaskState> {
  EditingTaskBloc() : super(const EditingTaskState()) {
    on<HighPriority>(_onHighPriority);
  }

  void _onHighPriority(HighPriority event, Emitter<EditingTaskState> emit){
    final state = this.state;
    emit(state.copyWith(isRed: !state.isRed));
  }
}
