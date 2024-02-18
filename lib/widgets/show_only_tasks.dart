import 'package:flutter/material.dart';
import 'package:to_do/blocs/bloc_exports.dart';
import 'package:to_do/enums/sort_label.dart';

class ShowOnlyTask extends StatelessWidget {
  ShowOnlyTask({super.key});

  final _states = [
    SortLabel.low,
    SortLabel.medium,
    SortLabel.high,
    SortLabel.normalOrder,
    SortLabel.done,
    SortLabel.favourite,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DropDownBloc(),
      child: BlocBuilder<DropDownBloc, DropDownState>(
        builder: (BuildContext context, state) {
          return Container(
            width: 140,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.purpleAccent,
            ),
            child: Center(
              child: DropdownButton(
                dropdownColor: Colors.purpleAccent,
                items: _states.map((e) {
                  return DropdownMenuItem(
                    value: e.label,
                    child: Text(e.label),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  switch (newValue) {
                    case 'high':
                      context.read<DropDownBloc>().add(High());
                      context.read<TaskBloc>().add(const HighPriority());
                      break;
                    case 'medium':
                      context.read<DropDownBloc>().add(Medium());
                      context.read<TaskBloc>().add(const MediumPriority());
                      break;
                    case 'low':
                      context.read<DropDownBloc>().add(Low());
                      context.read<TaskBloc>().add(const LowPriority());
                      break;
                    case 'normal order':
                      context.read<DropDownBloc>().add(Normal());
                      context.read<TaskBloc>().add(const InitialOrder());
                      break;
                    case 'done':
                      context.read<DropDownBloc>().add(Done());
                      context.read<TaskBloc>().add(const DonePriority());
                      break;
                    case 'favourite':
                      context.read<DropDownBloc>().add(Favourite());
                      context.read<TaskBloc>().add(const FavouritePriority());
                      break;
                  }
                },
                value: state.state,
              ),
            ),
          );
        },
      ),
    );
  }
}
