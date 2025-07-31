// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PublicZikar {
  String? niyyah;
  DateTime start_date;
  DateTime end_date;
  String? createdBy;
  int? qty_done;
  int? qty_suppose;
  int? zikar_id;
  PublicZikar({
    this.niyyah,
    required this.start_date,
    required this.end_date,
    this.createdBy,
    this.qty_done,
    this.qty_suppose,
    this.zikar_id,
  });

  PublicZikar copyWith({
    String? niyyah,
    DateTime? start_date,
    DateTime? end_date,
    String? createdBy,
    int? qty_done,
    int? qty_suppose,
    int? zikar_id,
  }) {
    return PublicZikar(
      niyyah: niyyah ?? this.niyyah,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
      createdBy: createdBy ?? this.createdBy,
      qty_done: qty_done ?? this.qty_done,
      qty_suppose: qty_suppose ?? this.qty_suppose,
      zikar_id: zikar_id ?? this.zikar_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'niyyah': niyyah,
      'start_date': start_date.millisecondsSinceEpoch,
      'end_date': end_date.millisecondsSinceEpoch,
      'createdBy': createdBy,
      'qty_done': qty_done,
      'qty_suppose': qty_suppose,
      'zikar_id': zikar_id,
    };
  }

  factory PublicZikar.fromMap(Map<String, dynamic> map) {
    return PublicZikar(
      niyyah: map['niyyah']?.toString(),
      start_date: map['start_date'] != null
          ? DateTime.tryParse(map['start_date']) ?? DateTime.now()
          : DateTime.now(),
      end_date: map['end_date'] != null
          ? DateTime.tryParse(map['end_date']) ?? DateTime.now()
          : DateTime.now(),
      createdBy: map['created_by']?.toString(),
      qty_done: map['qty_done'] ?? 0,
      qty_suppose: map['qty_suppose'] ?? 0,
      zikar_id: map['zikar_id'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PublicZikar.fromJson(String source) =>
      PublicZikar.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PublicZikar(niyyah: $niyyah, start_date: $start_date, end_date: $end_date, createdBy: $createdBy, qty_done: $qty_done, qty_suppose: $qty_suppose, zikar_id: $zikar_id)';
  }

  @override
  bool operator ==(covariant PublicZikar other) {
    if (identical(this, other)) return true;

    return other.niyyah == niyyah &&
        other.start_date == start_date &&
        other.end_date == end_date &&
        other.createdBy == createdBy &&
        other.qty_done == qty_done &&
        other.qty_suppose == qty_suppose &&
        other.zikar_id == zikar_id;
  }

  @override
  int get hashCode {
    return niyyah.hashCode ^
        start_date.hashCode ^
        end_date.hashCode ^
        createdBy.hashCode ^
        qty_done.hashCode ^
        qty_suppose.hashCode ^
        zikar_id.hashCode;
  }
}
