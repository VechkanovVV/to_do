import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_app/blocs/bloc/task_bloc.dart';
import 'package:flutter_task_app/widgets/task_list.dart';

import '../modules/task.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({Key? key}) : super(key: key);

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

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
    required this.titleController,
  }) : super(key: key);

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'add task',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              label: Text(
                'Title',
                style: TextStyle(fontSize: 18.5),
              ),
              border: OutlineInputBorder(),
            ),
            controller: titleController,
          ),
          Row(children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
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
              child: Text(
                'Add',
              ),
            ),
          ]),
        ],
      ),
    );
  }

}
