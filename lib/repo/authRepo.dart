import 'package:audioapp/model/authModel.dart';
import 'package:audioapp/repo/local.dart';
import 'package:audioapp/service/authservice.dart';

class AuthRepository {
  final AuthService authservice;
  final Tokenstorage tokenstorage;
  AuthRepository({required this.authservice, required this.tokenstorage});
  Future<AuthModel> checkauth(String email, String password) async {
    final tokens = await authservice.login(email, password);
    await tokenstorage.savetoken(tokens);
    return tokens;
  }

  Future<void> refreshToken() async {
    final refreshToken = tokenstorage.regreshToken;
    if (refreshToken == null) throw Exception("No Refresh Token");
    final newtoken = await authservice.refreshtokenservice(refreshToken);
    await tokenstorage.savetoken(newtoken);
  }

  String? get accessToken => tokenstorage.accessToken;
}
