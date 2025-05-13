import 'package:flutter/material.dart';

class ThemeManagerProvider extends ChangeNotifier {
  bool isDark = false;
  changetheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
