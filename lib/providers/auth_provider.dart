import 'package:flutter/material.dart';
import 'package:orbitproject/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;

  String errormessage = "";
  final AuthServices authServices = AuthServices();
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();
    try {
      final token = await authServices.login(
        username: username,
        password: password,
      );
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);
      return true;
    } catch (e) {
      errormessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      await authServices.signup(
        email: email,
        username: username,
        password: password,
      );
      return true;
    } catch (e) {
      errormessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await authServices.logout();
    notifyListeners();
  }
}
