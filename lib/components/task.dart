class Task {
  Task({this.name, this.isDone = false});
  String name;
  bool isDone;

  void isDoneToggle() {
    isDone = !isDone;
  }
}
