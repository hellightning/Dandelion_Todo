import 'package:dandelion_todo/utils/Global.dart';
import 'package:dandelion_todo/utils/themes.dart';
import 'package:flutter/cupertino.dart';

class ConfigState extends ChangeNotifier {
  String theme = AppTheme.dark;
  String searchFilter = '';
  set setTheme(String thm) {
    theme = thm;
    Global.APP_THEME = thm;
  }

  ThemeColor get themeColor {
    return ThemeColor.themeMap[theme]!;
  }

  ConfigState() {
    theme = Global.appTheme;
  }
  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
