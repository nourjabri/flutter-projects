// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentModel {
  String name;
  int id;
  int classId;
  int parentId;
  String profilePicture;
  int fees;

  StudentModel({
    required this.name,
    required this.id,
    required this.classId,
    required this.parentId,
    required this.profilePicture,
    required this.fees,
  });

  StudentModel copyWith({
    String? name,
    int? classId,
    int? parentId,
    String? profilePicture,
    int? fees,
    int? id,
  }) {
    return StudentModel(
      name: name ?? this.name,
      classId: classId ?? this.classId,
      parentId: parentId ?? this.parentId,
      profilePicture: profilePicture ?? this.profilePicture,
      fees: fees ?? this.fees,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'class_id': classId,
      'parent_id': parentId,
      'profile_picture': profilePicture,
      'fees': fees,
      'id': id,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      name: map['name'] as String,
      classId: map['class_id'] as int,
      parentId: map['parent_id'] as int,
      profilePicture: map['profile_picture'] as String,
      fees: (map['fees'] as num).toInt(),
      id: (map['id'] as num).toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentModel(name: $name, class_id: $classId, parent_id: $parentId, profile_picture: $profilePicture, fees: $fees,id:$id, )';
  }

  @override
  bool operator ==(covariant StudentModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.classId == classId &&
        other.parentId == parentId &&
        other.profilePicture == profilePicture &&
        other.fees == fees;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        classId.hashCode ^
        parentId.hashCode ^
        profilePicture.hashCode ^
        fees.hashCode;
  }
}
