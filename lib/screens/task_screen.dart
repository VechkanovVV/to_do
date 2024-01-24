import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_app/blocs/bloc/task_bloc.dart';
import 'package:flutter_task_app/widgets/task_list.dart';

import '../modules/task.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({Key? key}) : super(key: key);
  TextEditingController titleController = TextEditingController();

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              TextField(controller: titleController,),
            ],
          ),
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
          title: Text('ToDo'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
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
