class Task {
  Task({required this.title, required this.date}) : isDone = false;
  late bool isDone;
  final String title;
  final DateTime date;
}

List<Task> tasks = [
  Task(title: "task1", date: DateTime.now()),
  Task(title: "task2", date: DateTime.now()),
  Task(title: "task3", date: DateTime.now()),
  Task(title: "task4", date: DateTime.now()),
];
