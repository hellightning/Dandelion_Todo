import 'dart:collection';

import 'dart:ffi';

import 'package:flutter/material.dart';

enum AppTheme { red, blue, green, purple, pink, light, dark }

class ThemeColor {
  ThemeColor(this.mainColor, this.subColor, this.warnColor, this.textColor,
      this.background, this.neglected, this.themeColor, this.name);
  static final themeMap = HashMap<AppTheme, ThemeColor>();
  Color mainColor = Colors.blue;
  Color subColor = Colors.blue[200]!;
  Color warnColor = Colors.red[400]!;
  Color textColor = Colors.black;
  Color background = Colors.blue[100]!;
  Color neglected = Colors.blueGrey;
  MaterialColor themeColor = Colors.blue;
  String name = 'undefined';
  // static const DANDELION_DARK = MaterialColor(

  // );
  // static const DANDELION_PINK = MaterialColor(

  // );
}

// const MaterialColor DANDELION_DARK = MaterialColor();
