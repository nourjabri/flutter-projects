

class FavoriteModel {
  String name;
  String img;
  int qty;
  bool isFav;
  FavoriteModel(
      {required this.img,
      required this.isFav,
      required this.name,
      required this.qty});
  tomap() {
    return {
      'name': name,
      'img': img,
      'qty': qty,
      'isFav': isFav,
    };
  }

  static fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
        img: map['img'],
        isFav: map['isFav'],
        name: map['name'],
        qty: map['qty']);
  }
}
