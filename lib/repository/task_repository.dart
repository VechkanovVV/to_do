import 'package:to_do/modules/task.dart';

abstract interface class TaskRepository {
  Future<List<Task>> getTasks();
  Future<void> add(Task task);
  Future<void> deleteTask(Task task);
}
