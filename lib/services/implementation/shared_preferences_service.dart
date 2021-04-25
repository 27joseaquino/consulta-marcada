import 'dart:convert';
import 'package:consulta_marcada/core/models/user.dart';
import 'package:consulta_marcada/data/prefs.dart';

class SharedPreferencesService {
  Future<User> activeUser() async {
    String result = await Prefs.getString("user.prefs");
    if (result.isEmpty) return null;

    Map map = json.decode(result);
    User user = User.fromJson(map);

    return user;
  }

  void saveUserPrefs(Map user) {
    Prefs.setString("user.prefs", jsonEncode(user));
  }

  void clearUserPrefs() {
    Prefs.setString("user.prefs", "");
  }
}
