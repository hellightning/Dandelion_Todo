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
  static AppTheme APP_THEME = AppTheme.dark;
  set setAppTheme(AppTheme at) {
    try {
      Global.APP_THEME = at;
      Global.THEME_COLOR = ThemeColor.themeMap[Global.APP_THEME]!;
    } catch (e) {
      throw Error();
    }
  }

  static ThemeColor THEME_COLOR = ThemeColor.themeMap[APP_THEME]!;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _pref = await SharedPreferences.getInstance();
    try {
      ThemeColor.themeMap[AppTheme.blue] = ThemeColor(
          Color(0xff0195ee),
          Color(0xff8bd3fd),
          Color(0xffe06f9f),
          Color(0xff05072d),
          Color(0xffbad8e8),
          Color(0xff6f83b3),
          'blue');

      ThemeColor.themeMap[AppTheme.red] = ThemeColor(
          Color(0xffff3e2e),
          Color(0xfff2b5a3),
          Color(0xff21b5ee),
          Color(0xff4b2d37),
          Color(0xffff7d82),
          Color(0xff806d83),
          'red');

      ThemeColor.themeMap[AppTheme.purple] = ThemeColor(
          Color(0xff000d9a),
          Color(0xfeac8aea),
          Color(0xfff40b04),
          Color(0xff131258),
          Color(0xff98a3f6),
          Color(0xff7967b3),
          'purple');

      ThemeColor.themeMap[AppTheme.pink] = ThemeColor(
          Color(0xffe07272),
          Color(0xfff1c7b7),
          Color(0xffa179e7),
          Color(0xffbd6e5e),
          Color(0xffeae5aa),
          Color(0xffd3b764),
          'pink');

      ThemeColor.themeMap[AppTheme.green] = ThemeColor(
          Color(0xff31b78a),
          Color(0xff7eeaa7),
          Color(0xffdb754d),
          Color(0xff007f6c),
          Color(0xffcef4a8),
          Color(0xff94c0b1),
          'green');

      ThemeColor.themeMap[AppTheme.dark] = ThemeColor(
          Color(0xffd0e0d0),
          Color(0xff343a54),
          Color(0xffe676af),
          Color(0xff95a197),
          Color(0xff242a44),
          Color(0xff584a5b),
          'dark');

      ThemeColor.themeMap[AppTheme.light] = ThemeColor(
          Color(0xff8098c2),
          Color(0xffd3f9d7),
          Color(0xffdea1a6),
          Color(0xff7092bd),
          Color(0xffffefef),
          Color(0xff9fbb9a),
          'light');
    } catch (e) {
      print('here');
      throw Error();
    }
  }

  // static const TodoTitleStyle = TextStyle(color: );
}
