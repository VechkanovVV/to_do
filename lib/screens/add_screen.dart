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
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Text(
              'add task',
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
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: TextField(
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
                          var task = Task(
                            title: state.title,
                            priority: state.priority,
                            description: state.description,
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
          ),
        );
      }),
    );
  }
}
