class RegisterRequest {
  final String email;
  final String password;
  final String name;
  final String confirmPassword;
  RegisterRequest({
    required this.confirmPassword,
    required this.email,
    required this.name,
    required this.password,
  });
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "password": password,
      "confrimPassword": confirmPassword,
      "email": email,
    };
  }
}
