import 'package:adminapp/view/create_parent.dart';
import 'package:flutter/material.dart';

class ParentListScreen extends StatelessWidget {
  const ParentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parents"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: "Add Parent",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CreateParentScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(child: Text("List of parents appere here")),
    );
  }
}
