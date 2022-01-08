import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemes { red, blue, green, purple, dark }

// global类管理全局变量
class Global {
  // todo yongSharedPreference实现账号本地存储...大概？
  // static SharedPreferences? _pref;

  static AppThemes currTheme = AppThemes.green;

  static Future init() async {
    // _pref = await SharedPreferences.getInstance();
  }

  // static const TodoTitleStyle = TextStyle(color: );
}
