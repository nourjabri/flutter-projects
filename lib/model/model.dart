// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AudioModel {
  String name;
  double duration;
  int id;
  double size;
  DateTime createdat;
  AudioModel({
    required this.name,
    required this.duration,
    required this.id,
    required this.size,
    required this.createdat,
  });

  AudioModel copyWith({
    String? name,
    double? duration,
    int? id,
    double? size,
    DateTime? createdat,
  }) {
    return AudioModel(
      name: name ?? this.name,
      duration: duration ?? this.duration,
      id: id ?? this.id,
      size: size ?? this.size,
      createdat: createdat ?? this.createdat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'duration': duration,
      'id': id,
      'size': size,
      'createdat': createdat.millisecondsSinceEpoch,
    };
  }

  factory AudioModel.fromMap(Map<String, dynamic> map) {
    return AudioModel(
      name: map['name'] as String,
      duration: map['duration'] as double,
      id: map['id'] as int,
      size: map['size'] as double,
      createdat: DateTime.fromMillisecondsSinceEpoch(map['createdat'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory AudioModel.fromJson(String source) =>
      AudioModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AudioModel(name: $name, duration: $duration, id: $id, size: $size, createdat: $createdat)';
  }

  @override
  bool operator ==(covariant AudioModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.duration == duration &&
        other.id == id &&
        other.size == size &&
        other.createdat == createdat;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        duration.hashCode ^
        id.hashCode ^
        size.hashCode ^
        createdat.hashCode;
  }
}
