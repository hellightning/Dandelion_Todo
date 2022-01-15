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
  static final themeMap = {
    'blue': ThemeColor(
        Color(0xff0195ee),
        Color(0xff8bd3fd),
        Color(0xffe06f9f),
        Color(0xff05072d),
        Color(0xffbad8e8),
        Color(0xff6f83b3),
        Colors.blue,
        'blue'),
    'red': ThemeColor(
        Color(0xffff3e2e),
        Color(0xfff2b5a3),
        Color(0xff21b5ee),
        Color(0xff4b2d37),
        Color(0xffff7d82),
        Color(0xff806d83),
        Colors.red,
        'red'),
    'purple': ThemeColor(
        Color(0xff000d9a),
        Color(0xfeac8aea),
        Color(0xfff40b04),
        Color(0xff131258),
        Color(0xff98a3f6),
        Color(0xff7967b3),
        Colors.deepPurple,
        'purple'),
    'pink': ThemeColor(
        Color(0xffe07272),
        Color(0xfff1c7b7),
        Color(0xffa179e7),
        Color(0xffbd6e5e),
        Color(0xffeae5aa),
        Color(0xffd3b764),
        Colors.pink,
        'pink'),
    'green': ThemeColor(
        Color(0xff31b78a),
        Color(0xff7eeaa7),
        Color(0xffdb754d),
        Color(0xff007f6c),
        Color(0xffcef4a8),
        Color(0xff94c0b1),
        Colors.lime,
        'green'),
    'dark': ThemeColor(
        Color(0xffd0e0d0),
        Color(0xff343a54),
        Color(0xffe676af),
        Color(0xff95a197),
        Color(0xff242a44),
        Color(0xff584a5b),
        Colors.indigo,
        'dark'),
    'light': ThemeColor(
        Color(0xff8098c2),
        Color(0xffd3f9d7),
        Color(0xffdea1a6),
        Color(0xff7092bd),
        Color(0xffffefef),
        Color(0xff9fbb9a),
        Colors.yellow,
        'light')
  };
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
