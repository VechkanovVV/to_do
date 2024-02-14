import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:to_do/enums/sort_label.dart';

part 'drop_down_bloc.freezed.dart';

part 'drop_down_event.dart';
part 'drop_down_state.dart';

class DropDownBloc extends Bloc<DropDownEvent, DropDownState> {
  DropDownBloc() : super(const DropDownState()) {
    on<High>(_onHigh);
    on<Medium>(_onMedium);
    on<Low>(_onLow);
    on<Normal>(_onNormal);
    on<Favourite>(_onFavourite);
    on<Done>(_onDone);
  }
  void _onDone(Done event, Emitter<DropDownState> emit) {
    emit(state.copyWith(state: SortLabel.done.label));
  }

  void _onFavourite(Favourite event, Emitter<DropDownState> emit) {
    emit(state.copyWith(state: SortLabel.favourite.label));
  }

  void _onNormal(Normal event, Emitter<DropDownState> emit) {
    emit(state.copyWith(state: SortLabel.normalOrder.label));
  }

  void _onLow(Low event, Emitter<DropDownState> emit) {
    emit(state.copyWith(state: SortLabel.low.label));
  }

  void _onMedium(Medium event, Emitter<DropDownState> emit) {
    emit(state.copyWith(state: SortLabel.medium.label));
  }

  void _onHigh(High event, Emitter<DropDownState> emit) {
    emit(state.copyWith(state: SortLabel.high.label));
  }
}
