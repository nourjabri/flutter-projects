// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PrivateKhtma {
  String? niyyah;
  DateTime startDate;
  DateTime endDate;
  String? createdBy;
  PrivateKhtma({
    required this.niyyah,
    required this.startDate,
    required this.endDate,
    required this.createdBy,
  });

  PrivateKhtma copyWith({
    String? niyyah,
    DateTime? startDate,
    DateTime? endDate,
    String? createdBy,
  }) {
    return PrivateKhtma(
      niyyah: niyyah ?? this.niyyah,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'niyyah': niyyah,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
      'createdBy': createdBy,
    };
  }

  factory PrivateKhtma.fromMap(Map<String, dynamic> map) {
    return PrivateKhtma(
      niyyah: map['niyyah'] != null ? map['niyyah'] as String : null,
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int),
      endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate'] as int),
      createdBy: map['createdBy'] != null ? map['createdBy'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PrivateKhtma.fromJson(String source) =>
      PrivateKhtma.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PrivateKhtma(niyyah: $niyyah, startDate: $startDate, endDate: $endDate, createdBy: $createdBy)';
  }

  @override
  bool operator ==(covariant PrivateKhtma other) {
    if (identical(this, other)) return true;

    return other.niyyah == niyyah &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.createdBy == createdBy;
  }

  @override
  int get hashCode {
    return niyyah.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        createdBy.hashCode;
  }
}
  