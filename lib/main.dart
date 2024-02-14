import 'package:flutter/material.dart';
import 'package:to_do/blocs/bloc_exports.dart';
import 'package:to_do/repository/firebase_task_repository.dart';
import 'package:to_do/repository/task_repository.dart';
import 'package:to_do/screens/task_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  TaskRepository db = FirebaseTaskRepository();
  runApp(MyApp(db: db));
}

class MyApp extends StatelessWidget {
  final TaskRepository db;
  MyApp({Key? key, required this.db}) : super(key: key);
  final lightColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(db: db),
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
