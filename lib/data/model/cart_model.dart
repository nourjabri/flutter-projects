// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CartItem {
  final String proId;
  final String proName;
  final String proImage;
  final double proPrice;
  int quantity;
  CartItem({
    required this.proId,
    required this.proName,
    required this.proImage,
    required this.proPrice,
    required this.quantity,
  });
  double get total => proPrice * quantity;

  CartItem copyWith({
    String? proId,
    String? proName,
    String? proImage,
    double? proPrice,
    int? quantity,
  }) {
    return CartItem(
      proId: proId ?? this.proId,
      proName: proName ?? this.proName,
      proImage: proImage ?? this.proImage,
      proPrice: proPrice ?? this.proPrice,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'proId': proId,
      'proName': proName,
      'proImage': proImage,
      'proPrice': proPrice,
      'quantity': quantity,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      proId: map['proId'] as String,
      proName: map['proName'] as String,
      proImage: map['proImage'] as String,
      proPrice: map['proPrice'] as double,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) =>
      CartItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartItem(proId: $proId, proName: $proName, proImage: $proImage, proPrice: $proPrice, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant CartItem other) {
    if (identical(this, other)) return true;

    return other.proId == proId &&
        other.proName == proName &&
        other.proImage == proImage &&
        other.proPrice == proPrice &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return proId.hashCode ^
        proName.hashCode ^
        proImage.hashCode ^
        proPrice.hashCode ^
        quantity.hashCode;
  }
}
