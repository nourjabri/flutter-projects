import 'dart:convert';

class Hadithmodel {
  String script;
  String tallerofhadith;
  String tilteofhadith;
  String hadithAudio;
  Hadithmodel({
    required this.script,
    required this.tallerofhadith,
    required this.tilteofhadith,
    required this.hadithAudio,
  });

  Hadithmodel copyWith(
      {String? script,
      String? tallerofhadith,
      String? tilteofhadith,
      String? hadithAudio}) {
    return Hadithmodel(
      script: script ?? this.script,
      tallerofhadith: tallerofhadith ?? this.tallerofhadith,
      tilteofhadith: tilteofhadith ?? this.tilteofhadith,
      hadithAudio: hadithAudio ?? this.hadithAudio,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'script': script,
      'tallerofhadith': tallerofhadith,
      'tilteofhadith': tilteofhadith,
    };
  }

  factory Hadithmodel.fromMap(Map<String, dynamic> map) {
    return Hadithmodel(
      script: map['script'] as String,
      hadithAudio: map['hadithAudio'] as String,
      tallerofhadith: map['tallerofhadith'] as String,
      tilteofhadith: map['tilteofhadith'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Hadithmodel.fromJson(String source) =>
      Hadithmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Hadithmodel(script: $script,hadithAudio:$hadithAudio, tallerofhadith: $tallerofhadith, tilteofhadith: $tilteofhadith)';

  @override
  bool operator ==(covariant Hadithmodel other) {
    if (identical(this, other)) return true;

    return other.script == script &&
        other.hadithAudio == hadithAudio &&
        other.tallerofhadith == tallerofhadith &&
        other.tilteofhadith == tilteofhadith;
  }

  @override
  int get hashCode =>
      script.hashCode ^
      tallerofhadith.hashCode ^
      hadithAudio.hashCode ^
      tilteofhadith.hashCode;
}
