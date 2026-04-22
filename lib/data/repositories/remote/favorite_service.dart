import 'package:dio/dio.dart';
import 'package:clickresturant/data/model/favorite.dart';

class FavoriteService {
  Future<bool> addToFavorite(FavoriteModel favorite) async {
    try {
      await Dio().post("https://67c137a161d8935867e235b4.mockapi.io/products",
          data: favorite.tomap());
      return true;
    } catch (e) {
      throw Exception("Failed to add favorite: $e");
    }
  }

  Future<List<FavoriteModel>> getFavorite() async {
    try {
      Response response = await Dio()
          .get("https://67c137a161d8935867e235b4.mockapi.io/products");
      return List.generate(response.data.length,
          (index) => FavoriteModel.fromMap(response.data[index]));
    } catch (e) {
      throw Exception("Failed to load favorites: $e");
    }
  }
}
