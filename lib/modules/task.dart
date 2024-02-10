import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:to_do/enums/priority_state.dart';
part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String title,
    @Default(false) bool isDone,
    @Default(false) bool isDeleted,
    @Default(false) bool isFavourite,
    @Default(PriorityState.none) PriorityState priority,
    @Default(true) bool isVisible,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
