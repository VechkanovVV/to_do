import 'package:flutter/material.dart';
import 'package:to_do/widgets/star_check_box.dart';

import '../blocs/bloc_exports.dart';
import '../enums/priority_state.dart';
import '../modules/task/task.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.tasks, required this.index});
  final List<Task> tasks;
  final int index;

  @override
  Widget build(BuildContext context) {
    var currentTask = tasks[index];
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
            color: (tasks[index].priority == PriorityState.high)
                ? Colors.red
                : (tasks[index].priority == PriorityState.low)
                    ? Colors.green
                    : (tasks[index].priority == PriorityState.medium)
                        ? Colors.yellow
                        : Colors.black,
            width: 3.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 3,
              ),
              GestureDetector(
                child: const Icon(
                  Icons.close,
                  size: 30,
                ),
                onTap: () {
                  context.read<TaskBloc>().add(DeleteTask(task: tasks[index]));
                },
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                width: 150,
                child: Text(
                  currentTask.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 27,
                  ),
                ),
              ),
            ],
          ),
          Row(children: [
            StarCheckBox(
              task: tasks[index],
            ),
            Checkbox(
              value: currentTask.isDone,
              onChanged: (value) {
                context.read<TaskBloc>().add(UpdateTask(task: tasks[index]));
              },
            ),
            const SizedBox(
              width: 4,
            ),
          ]),
        ],
      ),
    );
  }
}
