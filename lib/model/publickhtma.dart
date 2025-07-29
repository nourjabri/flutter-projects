// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PublicKhtma {
  String? niyyah;
  DateTime startDate;
  DateTime endDate;
  int pepolecount;
  String? createdBy;
  PublicKhtma({
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
      niyyah: niyyah ?? this.niyyah,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      pepolecount: pepolecount ?? this.pepolecount,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'niyyah': niyyah,
      'startDate': startDate,
      'endDate': endDate,
      'pepolecount': pepolecount,
      'createdBy': createdBy,
    };
  }

  factory PublicKhtma.fromMap(Map<String, dynamic> map) {
    return PublicKhtma(
      niyyah: map['niyyah']?.toString(),
      startDate: map['start_date'] != null
          ? DateTime.tryParse(map['start_date']) ?? DateTime.now()
          : DateTime.now(),
      endDate: map['end_date'] != null
          ? DateTime.tryParse(map['end_date']) ?? DateTime.now()
          : DateTime.now(),
      pepolecount: map['people_count'] ?? 0,
      createdBy: map['created_by']?.toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PublicKhtma.fromJson(String source) =>
      PublicKhtma.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PublicKhtma(niyyah: $niyyah, startDate: $startDate, endDate: $endDate, pepolecount: $pepolecount, createdBy: $createdBy)';
  }

  @override
  bool operator ==(covariant PublicKhtma other) {
    if (identical(this, other)) return true;

    return other.niyyah == niyyah &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.pepolecount == pepolecount &&
        other.createdBy == createdBy;
  }

  @override
  int get hashCode {
    return niyyah.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        pepolecount.hashCode ^
        createdBy.hashCode;
  }
}
