import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemes { red, blue, green, purple, dark }

// global类管理全局变量
class Global {
  // todo yongSharedPreference实现账号本地存储...大概？
  // static SharedPreferences? _pref;
  static const TODO_DRAWER_UNFINISHED = 0;
  static const TODO_DRAWER_FINISHED = 1;
  static const TODO_DRAWER_CONFIG = 2;
  static const TODO_DRAWER_ACCOUNT = 3;
  static AppThemes currTheme = AppThemes.green;

  static Future init() async {
    // _pref = await SharedPreferences.getInstance();
  }

  // static const TodoTitleStyle = TextStyle(color: );
}
