import 'package:dio/dio.dart';
import 'package:zamazam/model/userMoel.dart';

class UserService {
  Dio requestHandler;
  late Response response;
  UserService({required this.requestHandler});
  Usermodel? usermodel;
  Future<Usermodel> getuser() async {
    response = await requestHandler.get(
      "https://zamzaam.onrender.com/docs#/default/create_user_users__post",
    );
    usermodel = Usermodel.fromMap(response.data);
    return usermodel!;
  }
}
