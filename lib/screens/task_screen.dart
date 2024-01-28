import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/blocs/bloc/task_bloc.dart';
import 'package:to_do/widgets/task_list.dart';

import '../modules/task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskScreenState();
}
class _TaskScreenState extends State<TaskScreen>{
  TextEditingController titleController = TextEditingController();

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: AddTaskScreen(titleController: titleController),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      List<Task> taskList = state.tasks;
      return Scaffold(
        appBar: AppBar(
          title: const Text('ToDo'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Chip(
                label: Text(
                  'Tasks:',
                ),
              ),
            ),
            TaskList(tasks: taskList)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addTask(context),
          tooltip: 'Add Task',
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
    required this.titleController,
  }) : super(key: key);

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
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
          TextField(
            autofocus: true,
            decoration: const InputDecoration(
              label: Text(
                'Title',
                style: TextStyle(fontSize: 18.5),
              ),
              border: OutlineInputBorder(),
            ),
            controller: titleController,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancle',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                var task = Task(
                  title: titleController.text,
                );
                titleController.text ="";
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
  }

}
