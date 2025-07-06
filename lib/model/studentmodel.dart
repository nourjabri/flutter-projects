// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentModel {
  String name;
  int id;
  int class_id;
  int parent_id;
  String profile_picture;
  int fees;

  StudentModel({
    required this.name,
    required this.id,
    required this.class_id,
    required this.parent_id,
    required this.profile_picture,
    required this.fees,
  });

  StudentModel copyWith({
    String? name,
    int? class_id,
    int? parent_id,
    String? profile_picture,
    int? fees,
    int? id,
  }) {
    return StudentModel(
      name: name ?? this.name,
      class_id: class_id ?? this.class_id,
      parent_id: parent_id ?? this.parent_id,
      profile_picture: profile_picture ?? this.profile_picture,
      fees: fees ?? this.fees,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'class_id': class_id,
      'parent_id': parent_id,
      'profile_picture': profile_picture,
      'fees': fees,
      'id': id,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      name: map['name'] as String,
      class_id: map['class_id'] as int,
      parent_id: map['parent_id'] as int,
      profile_picture: map['profile_picture'] as String,
      fees: (map['fees'] as num).toInt(),
      id: (map['id'] as num).toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentModel(name: $name, class_id: $class_id, parent_id: $parent_id, profile_picture: $profile_picture, fees: $fees,id:$id, )';
  }

  @override
  bool operator ==(covariant StudentModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.class_id == class_id &&
        other.parent_id == parent_id &&
        other.profile_picture == profile_picture &&
        other.fees == fees;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        class_id.hashCode ^
        parent_id.hashCode ^
        profile_picture.hashCode ^
        fees.hashCode;
  }
}
