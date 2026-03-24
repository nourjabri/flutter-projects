class UserModel {
  final String firstName;
  final String uid;
  final String lastName;
  final String email;
  final String phone;
  UserModel(
      {required this.lastName,
      required this.uid,
      required this.phone,
      required this.email,
      required this.firstName});
  Map<String, dynamic> toMap() => {
        "uid": uid,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "email": email,
      };
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        lastName: map["lastName"],
        uid: map["uid"],
        phone: map["phone"],
        email: map["email"],
        firstName: map["firstName"]);
  }
}
