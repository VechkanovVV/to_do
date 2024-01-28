import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/blocs/bloc_exports.dart';

import '../modules/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key, required this.tasks}) : super(key: key);
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          var currentTask = tasks[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1.5,
              ),
            ),
            child: ListTile(
              title: Text(currentTask.title),
              trailing: Checkbox(
                value: currentTask.isDone,
                onChanged: (value) {
                  context.read<TaskBloc>().add(UpdateTask(task: tasks[index]));
                },
              ),
              onLongPress: () =>
                  context.read<TaskBloc>().add(DeleteTask(task: tasks[index])),
            ),
          );
        },
      ),
    );
  }
}
