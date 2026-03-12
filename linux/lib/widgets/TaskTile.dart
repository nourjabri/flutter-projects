import 'package:flutter/material.dart';

import '../models/task.dart';


class Tasktile extends StatelessWidget {
  final Task task;
  final VoidCallback onChanged;
  final VoidCallback onDelete;
  Tasktile(
      {super.key,
      required this.task,
      required this.onChanged,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(
          onPressed: onDelete,
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          )),
      title: Text(
        task.title,
        style: TextStyle(
            decoration:
                task.isDone ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      leading: Checkbox(value: task.isDone, onChanged: (value) => onChanged()),
    );
  }
}
