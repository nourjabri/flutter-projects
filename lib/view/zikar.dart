import 'package:flutter/material.dart';

class ZikarScreen extends StatefulWidget {
  const ZikarScreen({super.key});

  @override
  State<ZikarScreen> createState() => _ZikarScreenState();
}

class _ZikarScreenState extends State<ZikarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("جلسة ذكر")));
  }
}
