import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_app/blocs/bloc/task_bloc.dart';
import 'package:flutter_task_app/modules/task.dart';
import 'package:flutter_task_app/screens/task_screen.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        title: 'ToDo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: TaskScreen(),
      ),
    );
  }
}
