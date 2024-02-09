import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/blocs/bloc/task_bloc.dart';

import 'package:to_do/widgets/task_list.dart';

import '../modules/task.dart';
import '../widgets/show_only_tasks.dart';
import 'add_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late int number;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const AddTaskScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      List<Task> taskList = state.tasks.where((e) => e.isVisible).toList();
      Set<String> titles = state.titles;

      number = taskList.length;

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text(
            'ToDo',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          actions: [ShowOnlyTask()],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Chip(
                label: Text(
                  'Tasks: $number',
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TaskList(
              tasks: taskList,
              titles: titles,
            )
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
