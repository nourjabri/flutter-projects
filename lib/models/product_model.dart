class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });
  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? "",
      price: (map['price'] as num).toDouble(),
      description: map['description'] ?? "",
      category: map['category'] ?? "",
      image: map['image'] ?? "",
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'category': category,
      'image': image,
    };
  }
}
