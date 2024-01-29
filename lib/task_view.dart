import 'package:assignment_todo_app/task_class.dart';
import 'package:flutter/material.dart';

class TaskView extends StatefulWidget {
  const TaskView(this.task,
      {super.key, required this.removeTask, required this.index});
  final Task task;
  final Function removeTask;
  final int index;
  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 27, right: 14),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.task.isDone = !widget.task.isDone;
            });
          },
          child: Container(
            width: 40,
            height: 30,
            decoration: BoxDecoration(
                color: widget.task.isDone ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0XFFE8E8E8), width: 2)),
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 13),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Text(
                widget.task.title,
                maxLines: 2,
                style: TextStyle(
                    fontFamily: "SFPRO",
                    decoration: widget.task.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: const Color(0xffA3A3A3),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: widget.task.isDone
                        ? const Color(0xffA3A3A3)
                        : const Color(0xff737373)),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "${widget.task.date.hour.toString()}:${widget.task.date.minute.toString()}",
                        style: TextStyle(
                            fontFamily: "SFPRO",
                            fontSize: 13,
                            decoration: widget.task.isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            decorationColor: const Color(0xffA3A3A3),
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffA3A3A3)),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.task.date.hour >= 12 ? "PM" : "AM",
                        style: TextStyle(
                            fontFamily: "SFPRO",
                            decoration: widget.task.isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            decorationColor: const Color(0xffA3A3A3),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffA3A3A3)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      widget.removeTask(widget.index);
                    },
                    icon: const Icon(Icons.delete, size: 30),
                    color: Colors.black,
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
