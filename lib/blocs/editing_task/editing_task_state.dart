part of 'editing_task_bloc.dart';

@freezed
 class EditingTaskState with _$EditingTaskState {
  const factory EditingTaskState({
    @Default('') String title,
    @Default(false) bool isRed,
    @Default(false) bool isGreen,
    @Default(false) bool isYellow,
}) = _EditingTaskState;

}


