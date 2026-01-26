// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BusMonetorModel {
  String username;
  String phone_number;
  int id;
  String role;
  bool is_active;

  BusMonetorModel({
    required this.username,
    required this.phone_number,
    required this.id,
    required this.role,
    required this.is_active,
  });

  BusMonetorModel copyWith({
    String? username,
    String? phone_number,
    int? id,
    String? role,
    bool? is_active,
  }) {
    return BusMonetorModel(
      username: username ?? this.username,
      phone_number: phone_number ?? this.phone_number,
      id: id ?? this.id,
      role: role ?? this.role,
      is_active: is_active ?? this.is_active,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'phone_number': phone_number,
      'id': id,
      'role': role,
      'is_active': is_active,
    };
  }

  factory BusMonetorModel.fromMap(Map<String, dynamic> map) {
    return BusMonetorModel(
      username: map['username'] as String,
      phone_number: map['phone_number'] as String,
      id: map['id'] as int,
      role: map['role'] as String,
      is_active: map['is_active'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory BusMonetorModel.fromJson(String source) =>
      BusMonetorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BusMonetorModel(username: $username, phone_number: $phone_number, id: $id, role: $role, is_active: $is_active)';
  }

  @override
  bool operator ==(covariant BusMonetorModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.phone_number == phone_number &&
        other.id == id &&
        other.role == role &&
        other.is_active == is_active;
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
