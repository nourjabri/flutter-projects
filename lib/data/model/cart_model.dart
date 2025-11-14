class CartItem {
  final String id;
  final String name;
  final String img;
  final double price;
  int quantity;
  CartItem(
      {required this.id,
      required this.img,
      required this.name,
      required this.price,
      required this.quantity,
      required String image});
  double get total => price * quantity;
}
