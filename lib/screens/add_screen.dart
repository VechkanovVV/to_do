import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../modules/task/task.dart';
import '../widgets/priority_widget.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditingTaskBloc(),
      child: BlocBuilder<EditingTaskBloc, EditingTaskState>(
          builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'add task',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const PriorityWidget(),
              const SizedBox(
                height: 10,
              ),
              TextField(
                autofocus: true,
                onChanged: (text) {
                  context.read<EditingTaskBloc>().add(SetTitleEvent(text));
                },
                decoration: const InputDecoration(
                  label: Text(
                    'Title',
                    style: TextStyle(fontSize: 18.5),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancle',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    var task = Task(
                      title: state.title,
                      priority: state.priority,
                    );
                    context.read<TaskBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Add',
                  ),
                ),
              ]),
            ],
          ),
        );
      }),
    );
  }
}
