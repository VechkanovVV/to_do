import 'package:flutter/material.dart';
import 'package:to_do/blocs/bloc_exports.dart';
import 'package:to_do/widgets/star_check_box.dart';

import '../modules/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key, required this.tasks, required this.titles})
      : super(key: key);
  final List<Task> tasks;
  final Set<String> titles;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          var currentTask = tasks[index];
          return Column(children: [
            Container(
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1.5,
                  color: Colors.purple,
                ),
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
                          context
                              .read<TaskBloc>()
                              .add(DeleteTask(task: tasks[index]));
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
                        context
                            .read<TaskBloc>()
                            .add(UpdateTask(task: tasks[index]));
                      },
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: ((tasks[index].isRed ?? false) ||
                              (tasks[index].isGreen ?? false) ||
                              (tasks[index].isYellow ?? false))
                          ? 8
                          : 0,
                      color: (tasks[index].isRed ?? false)
                          ? Colors.red
                          : (tasks[index].isGreen ?? false)
                              ? Colors.green
                              : (tasks[index].isYellow ?? false)
                                  ? Colors.yellow
                                  : Colors.white,
                    ),
                  ]),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ]);
        },
      ),
    );
  }
}
