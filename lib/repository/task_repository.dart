import '../modules/task/task.dart';

abstract interface class TaskRepository {
  Future<List<Task>> getTasks();
  Future<void> add(Task task);
  Future<void> deleteTask(Task task);
  Future<void> updateTask(Task task);
}
