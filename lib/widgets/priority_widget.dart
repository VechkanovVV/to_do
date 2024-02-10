import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/enums/priority_state.dart';

import '../blocs/editing_task/editing_task_bloc.dart';

class PriorityWidget extends StatelessWidget {
  const PriorityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _PriorityWidget();
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
                  size: (state.priority == PriorityState.high) ? 17 : 0,
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
                  size: (state.priority == PriorityState.medium) ? 17 : 0,
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
                  size: (state.priority == PriorityState.low) ? 17 : 0,
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
