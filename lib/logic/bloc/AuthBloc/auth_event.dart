abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String fristName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  RegisterEvent(
      {required this.fristName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.phone});
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent({required this.email, required this.password});
}
