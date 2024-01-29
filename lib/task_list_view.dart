import 'package:assignment_todo_app/task_class.dart';
import 'package:assignment_todo_app/task_view.dart';
import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key, required this.tasks});
  final List<Task> tasks;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  removeTask(int index) {
    setState(() {
      tasks.remove(tasks[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          return TaskView(
            widget.tasks[index],
            removeTask: removeTask,
            index: index,
          );
        });
  }
}
