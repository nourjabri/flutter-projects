// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Usermodel {
  String username;
  String password;
  String token;
  Usermodel({
    required this.username,
    required this.password,
    required this.token,
  });

  Usermodel copyWith({String? username, String? password, String? token}) {
    return Usermodel(
      username: username ?? this.username,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'token': token,
    };
  }

  factory Usermodel.fromMap(Map<String, dynamic> map) {
    return Usermodel(
      username: map['username'] as String,
      password: map['password'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Usermodel.fromJson(String source) =>
      Usermodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'usermodel(username: $username, password: $password, token: $token)';

  @override
  bool operator ==(covariant Usermodel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.password == password &&
        other.token == token;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode ^ token.hashCode;
}
