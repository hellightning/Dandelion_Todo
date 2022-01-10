import 'dart:collection';

import 'dart:ffi';

import 'package:flutter/material.dart';

enum AppTheme { red, blue, green, purple, pink, light, dark }

class ThemeColor {
  ThemeColor(this.mainColor, this.subColor, this.textColor, this.background,
      this.neglected);
  static final themeMap = HashMap<AppTheme, ThemeColor>();
  Color mainColor = Colors.blue;
  Color subColor = Colors.blue[200]!;
  Color textColor = Colors.black;
  Color background = Colors.blue[100]!;
  Color neglected = Colors.blueGrey;
  // Color lightColor = Colors.grey[200]!;
}
