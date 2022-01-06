import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static SharedPreferences _pref;

  static Future init() async {
    _pref = await SharedPreferences.getInstance();
  }
}
