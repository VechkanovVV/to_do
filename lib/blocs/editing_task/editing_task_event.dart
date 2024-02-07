part of 'editing_task_bloc.dart';

abstract class EditingTaskEvent extends Equatable {
  const EditingTaskEvent();

  @override
  List<Object> get props => [];
}

class HighPriority extends EditingTaskEvent {
  final bool isRed;

  const HighPriority({
    required this.isRed,
  });
  @override
  List<Object> get props => [isRed];
}
class MediumPriority extends EditingTaskEvent {
  final bool isYellow;

  const MediumPriority({
    required this.isYellow,
  });
  @override
  List<Object> get props => [isYellow];
}
class LowPriority extends EditingTaskEvent {
  final bool isGreen;

  const LowPriority({
    required this.isGreen,
  });
  @override
  List<Object> get props => [isGreen];
}

