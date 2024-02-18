import 'package:flutter/material.dart';
import 'package:to_do/enums/priority_state.dart';

import '../blocs/bloc_exports.dart';
import '../modules/task/task.dart';
import '../widgets/priority_widget.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({
    Key? key,
    required this.task,
  }) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditingTaskBloc(priority: task.priority),
      child: BlocBuilder<EditingTaskBloc, EditingTaskState>(
          builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Text(
              'Edit task',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const PriorityWidget(),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: task.title,
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
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: TextFormField(
                    initialValue: task.description,
                    maxLines: 5,
                    onChanged: (text) {
                      context
                          .read<EditingTaskBloc>()
                          .add(SetDescriptionEvent(text));
                    },
                    decoration: const InputDecoration(
                      label: Text(
                        'Description',
                        style: TextStyle(fontSize: 18.5),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancel',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          var newTask = task.copyWith(
                            title:
                                (state.title != '') ? state.title : task.title,
                            description: (state.description != '')
                                ? state.description
                                : task.description,
                            priority: (state.priority != PriorityState.none)
                                ? state.priority
                                : task.priority,
                          );
                          context
                              .read<TaskBloc>()
                              .add(EditTask(task1: task, task2: newTask));
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Confirm',
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        );
      }),
    );
  }
}
