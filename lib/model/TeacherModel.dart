// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeacherModel {
  String username;
  String phone_number;
  int id;
  String role;
  bool is_active;
  String password;

  TeacherModel({
    required this.username,
    required this.phone_number,
    required this.id,
    required this.role,
    required this.is_active,
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
      phone_number: phoneNumber ?? this.phone_number,
      id: id ?? this.id,
      role: role ?? this.role,
      is_active: isActive ?? this.is_active,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'phone_number': phone_number,
      'id': id,
      'role': role,
      'isActive': is_active,
      'password': password,
    };
  }

  factory TeacherModel.fromMap(Map<String, dynamic> map) {
    return TeacherModel(
      username: map['username']?.toString() ?? '',
      phone_number: map['phone_number']?.toString() ?? '',
      id: map['id'] ?? 0,
      role: map['role']?.toString() ?? '',
      is_active: map['is_active'] ?? false,
      password: map['password']?.toString() ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherModel.fromJson(String source) =>
      TeacherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TeacherModel(username: $username, phoneNumber: $phone_number, id: $id, role: $role, isActive: $is_active)';
  }

  @override
  bool operator ==(covariant TeacherModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.phone_number == phone_number &&
        other.id == id &&
        other.role == role &&
        other.is_active == is_active &&
        other.password == password;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        phone_number.hashCode ^
        id.hashCode ^
        role.hashCode ^
        is_active.hashCode;
  }
}
