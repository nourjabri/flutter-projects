import 'package:quranapp/domain/entites/shop_entity.dart';

class ShopModel {
  final String id;
  final String name;
  final String description;
  final String coverPhoto;
  final int minOrder;
  final String eta;
  final String location;
  final bool isOpen;

  ShopModel({
    required this.id,
    required this.name,
    required this.description,
    required this.coverPhoto,
    required this.minOrder,
    required this.eta,
    required this.location,
    required this.isOpen,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    final shopName = json['shopName'];
    final description = json['description'];
    final address = json['address'];

    return ShopModel(
      id: json['_id'].toString(),

      name: shopName is Map
          ? shopName['ar'] ?? shopName['en'] ?? ''
          : shopName?.toString() ?? '',

      description: description is Map
          ? description['ar'] ?? description['en'] ?? ''
          : description.toString(),

      coverPhoto: json['coverPhoto'].toString(),

      minOrder: json['minimumOrder'] is Map
          ? json['minimumOrder']['amount'] ?? 0
          : 0,

      eta: json['estimatedDeliveryTime'].toString(),

      location: address is Map
          ? "${address['city'] ?? ''}, ${address['street'] ?? ''}"
          : '',

      isOpen: json['availability'] == true,
    );
  }

  ShopEntity toEntity() => ShopEntity(
    id: id,
    name: name,
    description: description,
    coverPhoto: coverPhoto,
    minOrder: minOrder,
    eta: eta,
    location: location,
    isOpen: isOpen,
  );
}
