import 'package:audioapp/model/authModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tokenstorage {
  final SharedPreferences prefs;

  Tokenstorage(this.prefs);

  Future<void> savetoken(AuthModel model) async {
    await prefs.setString('access_token', model.accessToken);
    await prefs.setString('refresh_token', model.refreshToken);
    
  }

  String? get accessToken => prefs.getString('access_token');
  String? get regreshToken => prefs.getString('refresh_token');
  


  Future<void> clear() async {
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
  }
}
