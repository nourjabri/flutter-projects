// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Offermodel {
  String name;
  String description;
  String contact_info;
  num price_per_liter;
  Offermodel({
    required this.name,
    required this.description,
    required this.contact_info,
    required this.price_per_liter,
  });

  Offermodel copyWith({
    String? name,
    String? description,
    String? contact_info,
    num? price_per_liter,
  }) {
    return Offermodel(
      name: name ?? this.name,
      description: description ?? this.description,
      contact_info: contact_info ?? this.contact_info,
      price_per_liter: price_per_liter ?? this.price_per_liter,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'contact_info': contact_info,
      'price_per_liter': price_per_liter,
    };
  }

  factory Offermodel.fromMap(Map<String, dynamic> map) {
    return Offermodel(
      name: map['name'] as String,
      description: map['description'] as String,
      contact_info: map['contact_info'] as String,
      price_per_liter: map['price_per_liter'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Offermodel.fromJson(String source) =>
      Offermodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Offermodel(name: $name, description: $description, contact_info: $contact_info, price_per_liter: $price_per_liter)';
  }

  @override
  bool operator ==(covariant Offermodel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.contact_info == contact_info &&
        other.price_per_liter == price_per_liter;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        contact_info.hashCode ^
        price_per_liter.hashCode;
  }
}
