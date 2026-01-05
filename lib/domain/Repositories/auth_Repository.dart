import 'package:fashionproject/data/models/register/registerRequest.dart';
import 'package:fashionproject/domain/Entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> register(RegisterRequest request);
}
