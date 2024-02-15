import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_do/modules/device_info/device_info.dart';
import 'package:to_do/repository/task_repository.dart';

import '../firebase_options.dart';
import '../modules/task/task.dart';

class FirebaseTaskRepository implements TaskRepository {
  @override
  Future<void> add(Task task) async {
    await _init();
    String key = await DeviceInfo.getInfo();
    FirebaseFirestore.instance
        .collection(key)
        .doc(task.title)
        .set(task.toJson());
  }

  @override
  Future<void> deleteTask(Task task) async {
    await _init();
    String key = await DeviceInfo.getInfo();
    await FirebaseFirestore.instance.collection(key).doc(task.title).delete();
  }

  @override
  Future<List<Task>> getTasks() async {
    await _init();
    String key = await DeviceInfo.getInfo();
    var snapshot = await FirebaseFirestore.instance.collection(key).get();
    return snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList();
  }

  @override
  Future<void> updateTask(Task task) async {
    await _init();
    String key = await DeviceInfo.getInfo();
    await FirebaseFirestore.instance
        .collection(key)
        .doc(task.title)
        .set(task.toJson());
  }

  Future<void> _init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
}
