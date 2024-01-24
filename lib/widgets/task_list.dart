import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modules/task.dart';

class TaskList extends StatelessWidget{
  const TaskList({Key? key, required this.tasks}) : super(key: key);
  final List<Task> tasks;


  @override
  Widget build(BuildContext context) {
   return Expanded(
     child: ListView.builder(
       itemCount: tasks.length,
       itemBuilder: (context, index) {
         var currentTask = tasks[index];
         return ListTile(
           title: Text(currentTask.title),
           trailing: Checkbox(
             value: currentTask.isDone,
             onChanged: (value) {},
           ),
         );
       },
     ),
   );
  }
  
}