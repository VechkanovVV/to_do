import 'package:flutter/material.dart';
import 'package:to_do/blocs/bloc_exports.dart';
import 'package:to_do/enums/priority_state.dart';
import 'package:to_do/widgets/star_check_box.dart';

import '../modules/task/task.dart';
import 'list_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key, required this.tasks}) : super(key: key);
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {

          return Column(children: [
            ListItem(tasks: tasks, index: index,),
            const SizedBox(
              height: 5,
            ),
          ]);
        },
      ),
    );
  }
}
