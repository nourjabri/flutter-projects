// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final String proId;
  final String proName;
  final String proDec;
  final String proImage;
  final double proPrice;
  ProductModel({
    required this.proId,
    required this.proName,
    required this.proDec,
    required this.proImage,
    required this.proPrice,
  });

  ProductModel copyWith({
    String? proId,
    String? proName,
    String? proDec,
    String? proImage,
  }) {
    return ProductModel(
      proId: proId ?? this.proId,
      proName: proName ?? this.proName,
      proPrice: proPrice,
      proDec: proDec ?? this.proDec,
      proImage: proImage ?? this.proImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'proId': proId,
      'proName': proName,
      'proPrice': proPrice,
      'proDec': proDec,
      'proImage': proImage,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      proId: map['proId'] as String,
      proName: map['proName'] as String,
      proDec: map['proDec'] as String,
      proImage: map['proImage'] as String,
      proPrice: map['proPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      proId: json["proId"],
      proPrice: json["proPrice"],
      proName: json["proName"],
      proDec: json["proDec"],
      proImage: json["proImage"] is Map
          ? json["pro_image"]["url"]
          : json["pro_image"],
    );
  }
  @override
  String toString() {
    return 'ProductModel(proId: $proId, proName: $proName, proPrice:$proPrice,proDec: $proDec, proImage: $proImage)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.proId == proId &&
        other.proName == proName &&
        other.proDec == proDec &&
        other.proPrice==proPrice&&
        other.proImage == proImage;
  }

  @override
  int get hashCode {
    return proId.hashCode ^
        proName.hashCode ^
        proDec.hashCode ^
        proPrice.hashCode^
        proImage.hashCode;
  }
}
