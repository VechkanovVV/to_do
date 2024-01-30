import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/blocs/bloc_exports.dart';
import 'package:to_do/widgets/star_check_box.dart';

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
          return Column(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1.5,
                ),
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(currentTask.title),
                    Row(children: [
                      StarCheckBox(task: tasks[index], ),
                      Checkbox(
                        value: currentTask.isDone,
                        onChanged: (value) {
                          context
                              .read<TaskBloc>()
                              .add(UpdateTask(task: tasks[index]));
                        },
                      ),
                    ]),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
          ]);
        },
      ),
    );
  }
}
