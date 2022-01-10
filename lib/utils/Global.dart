import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'themes.dart';

// global类管理全局变量
class Global {
  // todo yongSharedPreference实现账号本地存储...大概？
  static SharedPreferences? _pref;
  static const TODO_DRAWER_UNFINISHED = 0;
  static const TODO_DRAWER_FINISHED = 1;
  static const TODO_DRAWER_CONFIG = 2;
  static const TODO_DRAWER_ACCOUNT = 3;

  // theme colors
  static AppTheme APP_THEME = AppTheme.blue;
  set setAppTheme(AppTheme at) {
    try {
      Global.APP_THEME = at;
      Global.THEME_COLOR = ThemeColor.themeMap[Global.APP_THEME]!;
    } catch (e) {
      throw Error();
    }
  }

  static ThemeColor THEME_COLOR = ThemeColor.themeMap[AppTheme.blue]!;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _pref = await SharedPreferences.getInstance();
    try {
      ThemeColor.themeMap[AppTheme.blue] = ThemeColor(
          Colors.blue,
          Colors.blue[200]!,
          Colors.black,
          Colors.blue[100]!,
          Colors.blueGrey[200]!);
    } catch (e) {
      print('here');
      throw Error();
    }
  }

  // static const TodoTitleStyle = TextStyle(color: );
}
