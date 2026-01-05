import 'package:fashionproject/domain/Entities/user_entity.dart';

class Registerresponse {
  final String token;
  final String password;
  final String email;
  final int userId;
  Registerresponse({
    required this.token,
    required this.email,
    required this.password,
    required this.userId,
  });
  factory Registerresponse.fromJson(Map<String, dynamic> json) {
    return Registerresponse(
      token: json["token"],
      password: json['password'],
      email: json['email'],
      userId: json["userId"],
    );
  }
  UserEntity toEntity() {
    return UserEntity(
      email: email,
      id: userId,
      password: password,
      token: token,
    );
  }
}
