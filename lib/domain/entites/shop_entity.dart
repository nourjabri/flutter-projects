import 'package:equatable/equatable.dart';

class ShopEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final String coverPhoto;
  final int minOrder;
  final String eta;
  final String location;
  final bool isOpen;

  const ShopEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.coverPhoto,
    required this.minOrder,
    required this.eta,
    required this.location,
    required this.isOpen,
  });

  @override
  List<Object?> get props =>
      [id, name, description, coverPhoto, minOrder, eta, location, isOpen];
}