import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/editing_task/editing_task_bloc.dart';

class PriorityWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditingTaskBloc(),
      child: _PriorityWidget(),
    );
  }
}

class _PriorityWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditingTaskBloc, EditingTaskState>(
        builder: (context, state) {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              context.read<EditingTaskBloc>().add(SetHighPriorityEvent());
            },
            child: Container(
              height: 30,
              width: 30,
              child: Center(
                child: Icon(
                  Icons.done,
                  size: state.isRed ? 17 : 0,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () {
              context.read<EditingTaskBloc>().add(SetMediumPriorityEvent());
            },
            child: Container(
              height: 30,
              width: 30,
              child: Center(
                child: Icon(
                  Icons.done,
                  size: state.isYellow ? 17 : 0,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.yellow,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () {
              context.read<EditingTaskBloc>().add(SetLowPriorityEvent());
            },
            child: Container(
              height: 30,
              width: 30,
              child: Center(
                child: Icon(
                  Icons.done,
                  size: state.isGreen ? 17 : 0,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.green,
              ),
            ),
          ),
        ],
      );
    });
  }
}
