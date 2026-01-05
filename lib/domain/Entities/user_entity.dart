class UserEntity {
  final String email;
  final String password;
  final String token;
  final int id;
  UserEntity({
    required this.email,
    required this.id,
    required this.password,
    required this.token,
  });
}
