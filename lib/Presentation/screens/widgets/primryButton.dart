import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Primrybutton extends StatelessWidget {
  final String titleButton;
  final Function onPressButton;
  final Color buttonColor;
  final Color textColor;
  const Primrybutton({
    super.key,
    required this.onPressButton,
    required this.titleButton,
    required this.textColor,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          onPressButton();
        },
        child: Text(
          '$titleButton',
          style: TextStyle(color: textColor, fontSize: 24),
        ),
      ),
    );
  }
}
