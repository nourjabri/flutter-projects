import 'package:fashionproject/data/models/register/registerRequest.dart';
import 'package:fashionproject/domain/Entities/user_entity.dart';
import 'package:fashionproject/domain/Repositories/auth_repository.dart';
import 'package:fashionproject/domain/Repositories/registerRemoteDataSource.dart';

class AuthRepositoryimpl implements AuthRepository {
  final RegisterRemoteDataSource remoteDataSource;
  AuthRepositoryimpl(this.remoteDataSource);
  @override
  Future<UserEntity> register(RegisterRequest request) async {
    final response = await remoteDataSource.register(request);
    return response.toEntity();
  }
}
