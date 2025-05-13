class ProductModel {
  int id;
  int rest_id;
  String name;
  double price;
  int qty;
  String img;
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.qty,
    required this.img,
    required this.rest_id,
  });
}
