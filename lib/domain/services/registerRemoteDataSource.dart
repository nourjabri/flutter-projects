import 'package:fashionproject/data/models/register/registerRequest.dart';
import 'package:fashionproject/data/models/register/registerResponse.dart';

abstract class RegisterRemoteDataSource {
  Future<Registerresponse> register(RegisterRequest request);
}
