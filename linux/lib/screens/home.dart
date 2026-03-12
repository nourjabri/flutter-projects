import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/TaskTile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Task> tasks = [];
  final TextEditingController controller = TextEditingController();
  void addTask() {
    if (controller.text.isEmpty) return;
    setState(() {
      tasks.add(Task(title: controller.text));
    });
    controller.clear();
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index].isDone = !tasks[index].isDone;
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Tasks"), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(hintText: "Add new Task"),
                  ),
                ),
                IconButton(
                  onPressed: addTask,
                  icon: const Icon(Icons.add, color: Colors.purpleAccent),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Tasktile(
                  task: tasks[index],
                  onChanged: () => toggleTask(index),
                  onDelete: () => deleteTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
