class UserModel {
  int id;
  String username;
  String password;
  String email;
  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.username,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'email': email,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      password: map['password'],
      username: map['username'],
    );
  }
}
