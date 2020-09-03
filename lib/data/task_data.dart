import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:todowo/components/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: "buy Something"),
    Task(name: "buy bread"),
    Task(name: "buy egg"),
    Task(name: "buy milk"),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get tasksCount => _tasks.length;

  void addTask(String taskName) {
    _tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.isDoneToggle();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
