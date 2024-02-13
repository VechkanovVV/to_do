import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/task_bloc.dart';
import '../modules/task/task.dart';

class StarCheckBox extends StatelessWidget {
  final Task task;

  const StarCheckBox({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TaskBloc>().add(TopTask(task: task));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Icons.star_border,
            color: Colors.black,
            size: 32.0,
          ),
          Icon(
            Icons.star,
            color: (task.isFavourite) ? Colors.yellow : Colors.transparent,
            size: 32.0,
          ),
        ],
      ),
    );
  }
}
