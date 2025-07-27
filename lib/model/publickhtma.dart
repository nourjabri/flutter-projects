// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PublicKhtma {
  String id;
  String niyyah;
  DateTime startDate;
  DateTime endDate;
  int pepolecount;
  String createdBy;
  PublicKhtma({
    required this.id,
    required this.niyyah,
    required this.startDate,
    required this.endDate,
    required this.pepolecount,
    required this.createdBy,
  });

  PublicKhtma copyWith({
    String? id,
    String? niyyah,
    DateTime? startDate,
    DateTime? endDate,
    int? pepolecount,
    String? createdBy,
  }) {
    return PublicKhtma(
      id: id ?? this.id,
      niyyah: niyyah ?? this.niyyah,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      pepolecount: pepolecount ?? this.pepolecount,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'niyyah': niyyah,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
      'pepolecount': pepolecount,
      'createdBy': createdBy,
    };
  }

  factory PublicKhtma.fromMap(Map<String, dynamic> map) {
    return PublicKhtma(
      id: map['id'] as String,
      niyyah: map['niyyah'] as String,
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int),
      endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate'] as int),
      pepolecount: map['pepolecount'] as int,
      createdBy: map['createdBy'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PublicKhtma.fromJson(String source) =>
      PublicKhtma.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PublicKhtma(id: $id, niyyah: $niyyah, startDate: $startDate, endDate: $endDate, pepolecount: $pepolecount, createdBy: $createdBy)';
  }

  @override
  bool operator ==(covariant PublicKhtma other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.niyyah == niyyah &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.pepolecount == pepolecount &&
        other.createdBy == createdBy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        niyyah.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        pepolecount.hashCode ^
        createdBy.hashCode;
  }
}
