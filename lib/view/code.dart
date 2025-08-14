import 'package:audioapp/mainbuttons/colors.dart';
import 'package:flutter/material.dart';

class CodeConfirm extends StatefulWidget {
  const CodeConfirm({super.key});

  @override
  State<CodeConfirm> createState() => _CodeConfirmState();
}

class _CodeConfirmState extends State<CodeConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text("يتم العمل على هذه الواجة ",
              style: TextStyle(
                  fontFamily: "Cairo",
                  color: Appcolor().primarycolor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600))),
    );
  }
}
