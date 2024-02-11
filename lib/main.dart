import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/blocs/bloc/task_bloc.dart';
import 'package:to_do/repository/firebase_task_repository.dart';
import 'package:to_do/repository/task_repository.dart';
import 'package:to_do/screens/task_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'modules/task.dart';

Future<void> main() async {
  TaskRepository db = FirebaseTaskRepository();
  await db.add(Task(title: 'kek'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final lightColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: lightColorScheme,
          useMaterial3: true,
        ),
        home: const TaskScreen(),
      ),
    );
  }
}
