import 'package:clickresturant/Core/constants/config.dart';
import 'package:flutter/material.dart';

class Conifrmorder extends StatefulWidget {
  const Conifrmorder({super.key});

  @override
  State<Conifrmorder> createState() => _ConifrmorderState();
}

class _ConifrmorderState extends State<Conifrmorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text(
          "Confirm My Order",
          style: TextStyle(
              fontSize: 24, color: fourColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
