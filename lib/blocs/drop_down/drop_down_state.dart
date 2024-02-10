part of 'drop_down_bloc.dart';

@freezed
class DropDownState with _$DropDownState {
  const factory DropDownState({
    @Default('normal order') String state,
  }) = _DropDownState;
}
