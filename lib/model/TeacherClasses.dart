// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeacherClasses {
  String name;
  int teacher_id;
  int id;

  TeacherClasses({
    required this.name,
    required this.teacher_id,
    required this.id,
  });

  TeacherClasses copyWith({String? name, int? teacher_id, int? id}) {
    return TeacherClasses(
      name: name ?? this.name,
      teacher_id: teacher_id ?? this.teacher_id,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'teacher_id': teacher_id, 'id': id};
  }

  factory TeacherClasses.fromMap(Map<String, dynamic> map) {
    return TeacherClasses(
      name: map['name'] as String,
      teacher_id: map['teacher_id'] as int,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherClasses.fromJson(String source) =>
      TeacherClasses.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TeacherClasses(name: $name, teacher_id: $teacher_id, id: $id)';

  @override
  bool operator ==(covariant TeacherClasses other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.teacher_id == teacher_id &&
        other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ teacher_id.hashCode ^ id.hashCode;
}
