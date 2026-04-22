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
    double? proPrice,
  }) {
    return ProductModel(
      proId: proId ?? this.proId,
      proName: proName ?? this.proName,
      proDec: proDec ?? this.proDec,
      proImage: proImage ?? this.proImage,
      proPrice: proPrice ?? this.proPrice,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      proId: json["proId"]?.toString() ?? "",
      proName: json["proName"] ?? "",
      proDec: json["proDec"] ?? "",
      proImage: json["proImage"] ?? "",
      proPrice: json["proPrice"] == null
          ? 0.0
          : double.tryParse(json["proPrice"].toString()) ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'proId': proId,
      'proName': proName,
      'proDec': proDec,
      'proImage': proImage,
      'proPrice': proPrice,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ProductModel(proId: $proId, proName: $proName, proDec: $proDec, proImage: $proImage, proPrice: $proPrice)';
  }
}
