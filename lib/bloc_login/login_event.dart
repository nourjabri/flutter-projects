import 'package:zamazam/model/userMoel.dart';

class LoginEvent {}

class Trylogin extends LoginEvent {
  final Usermodel user;
  Trylogin({required this.user});
}
