import 'dart:collection';
import 'package:flutter/material.dart';

class AppTheme {
  static const String blue = 'blue';
  static const String red = 'red';
  static const String green = 'green';
  static const String pink = 'pink';
  static const String purple = 'purple';
  static const String light = 'light';
  static const String dark = 'dark';
}

class ThemeColor {
  ThemeColor(this.mainColor, this.subColor, this.warnColor, this.textColor,
      this.background, this.neglected, this.themeColor, this.name);
  static final themeMap = HashMap<String, ThemeColor>();
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
