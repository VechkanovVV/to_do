part of 'editing_task_bloc.dart';

class EditingTaskState extends Equatable {
  final bool isRed;
  final bool isYellow;
  final bool isGreen;

  const EditingTaskState({
    this.isRed = false,
    this.isYellow = false,
    this.isGreen = false,
  });

  EditingTaskState copyWith({
    bool? isRed,
    bool? isYellow,
    bool? isGreen,
  }) {
    return EditingTaskState(
      isRed: isRed ?? this.isRed,
      isYellow: isYellow ?? this.isYellow,
      isGreen: isGreen ?? this.isGreen,
    );
  }

  @override
  List<Object?> get props => [
        isRed,
        isYellow,
        isGreen,
      ];
}
