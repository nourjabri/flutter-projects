import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SearchBar(
        trailing: [Icon(Icons.camera_alt_outlined)],
        hintText: "Search Workout,Trainer",
        leading: Icon(Icons.search),
      ),
    );
  }
}
