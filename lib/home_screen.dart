import 'package:assignment_todo_app/task_class.dart';
import 'package:assignment_todo_app/task_list_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController taskTitle = TextEditingController();
  void _addTask() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 250,
              child: Expanded(
                child: Column(
                  children: [
                    const Text(
                      textAlign: TextAlign.start,
                      "Add task",
                      style: TextStyle(
                          fontFamily: "SFPRO",
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 300,
                      height: 46,
                      child: TextField(
                        textAlignVertical: const TextAlignVertical(y: -1),
                        controller: taskTitle,
                        decoration: const InputDecoration(
                            fillColor: Color(0xffE3D8D8),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    const SizedBox(height: 60),
                    SizedBox(
                      width: 193,
                      height: 41,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black)),
                        onPressed: () {
                          setState(() {
                            tasks.add(Task(
                                title: taskTitle.text, date: DateTime.now()));
                            taskTitle.clear();
                            Navigator.of(context).pop();
                          });
                        },
                        child: const Text(
                          textAlign: TextAlign.start,
                          "Add",
                          style: TextStyle(
                              fontFamily: "SFPRO",
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Container(
              width: 42,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage(
                          "assets/3e531567a3537dc90a399876c35e4a32.jpeg"))),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 18, top: 26),
            child: Text(
              "Today",
              style: TextStyle(
                  fontFamily: "SFPRO",
                  fontSize: 34,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 31),
          Expanded(child: TaskList(tasks: tasks)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _addTask();
          });
        },
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        child: const Icon(
          Icons.add_circle_rounded,
          size: 50,
          color: Colors.black,
        ),
      ),
    );
  }
}
