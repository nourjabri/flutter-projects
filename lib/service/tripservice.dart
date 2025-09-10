import 'package:dio/dio.dart';
import 'package:myerp/model/tripmodel.dart';

class TripService {
  Dio dio = Dio();
  String baseurl =
      "https://schema.postman.com/json/collection/v2.1.0/collection.json";
  late Response response;

  Future<TripModel?> getTrip(String id) async {
    try {
      response = await dio.get(baseurl + id);
      TripModel trip = TripModel.fromMap(response.data);
      return trip;
    } catch (e) {
      print("we can't get the trip");
      print(e);
      return null;
    }
  }

  Future<TripModel?> getAllTrips() async {
    try {
      response = await dio.get(baseurl);
      List<TripModel> tripList = List.generate(
        response.data.length,
        (index) => TripModel.fromMap(response.data[index]),
      );
    } catch (e) {
      print(e);
      return null;
    }
  }
}
