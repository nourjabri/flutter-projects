// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String username;
  String email;
  String password;
  String first_name;
  String last_name;
  UserModel({
    required this.username,
    required this.email,
    required this.password,
    required this.first_name,
    required this.last_name,
  });

  UserModel copyWith({
    String? username,
    String? email,
    String? password,
    String? first_name,
    String? last_name,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
      'first_name': first_name,
      'last_name': last_name,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      first_name: map['first_name'] as String,
      last_name: map['last_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(username: $username, email: $email, password: $password, first_name: $first_name, last_name: $last_name)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.email == email &&
        other.password == password &&
        other.first_name == first_name &&
        other.last_name == last_name;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        password.hashCode ^
        first_name.hashCode ^
        last_name.hashCode;
  }
}
