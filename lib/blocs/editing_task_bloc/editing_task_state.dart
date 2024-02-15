part of 'editing_task_bloc.dart';

@freezed
class EditingTaskState with _$EditingTaskState {
  const factory EditingTaskState({
    @Default('') String title,
    @Default(PriorityState.none) priority,
  }) = _EditingTaskState;
}
