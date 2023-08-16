import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferenceHelper {
  final String _token = 'login_token';

  saveToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_token, value);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }

  clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_token);
  }
}
