import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_do/repository/task_repository.dart';

import '../firebase_options.dart';
import '../modules/task/task.dart';

class FirebaseTaskRepository implements TaskRepository {
  @override
  Future<void> add(Task task) async {
    await _init();
    FirebaseFirestore.instance.collection('tasks').add(task.toJson());
  }

  @override
  Future<void> deleteTask(Task task) async {
    await _init();
  }

  @override
  Future<List<Task>> getTasks() async {
    await _init();
    var snapshot = await FirebaseFirestore.instance.collection('tasks').get();
    return snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList();
  }

  Future<void> _init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
}
