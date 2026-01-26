// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeacherModel {
  String username;
  String phoneNumber;
  int id;
  String role;
  bool isActive;
  String password;

  TeacherModel({
    required this.username,
    required this.phoneNumber,
    required this.id,
    required this.role,
    required this.isActive,
    required this.password,
  });

  TeacherModel copyWith({
    String? username,
    String? phoneNumber,
    int? id,
    String? role,
    bool? isActive,
    String? password,
  }) {
    return TeacherModel(
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      id: id ?? this.id,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'phone_number': phoneNumber,
      'id': id,
      'role': role,
      'isActive': isActive,
      'password': password,
    };
  }

  factory TeacherModel.fromMap(Map<String, dynamic> map) {
    return TeacherModel(
      username: map['username']?.toString() ?? '',
      phoneNumber: map['phone_number']?.toString() ?? '',
      id: map['id'] ?? 0,
      role: map['role']?.toString() ?? '',
      isActive: map['is_active'] ?? false,
      password: map['password']?.toString() ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherModel.fromJson(String source) =>
      TeacherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TeacherModel(username: $username, phoneNumber: $phoneNumber, id: $id, role: $role, isActive: $isActive)';
  }

  @override
  bool operator ==(covariant TeacherModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.phoneNumber == phoneNumber &&
        other.id == id &&
        other.role == role &&
        other.isActive == isActive &&
        other.password == password;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        phoneNumber.hashCode ^
        id.hashCode ^
        role.hashCode ^
        isActive.hashCode;
  }
}
