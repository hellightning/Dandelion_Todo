import 'package:dandelion_todo/utils/Global.dart';
import 'package:dandelion_todo/utils/themes.dart';
import 'package:flutter/cupertino.dart';

class ConfigState extends ChangeNotifier {
  String get theme {
    return Global.appTheme;
  }

  String searchFilter = '';

  set setTheme(String thm) {
    Global.APP_THEME = thm;
  }

  ThemeColor get themeColor {
    return ThemeColor.themeMap[theme]!;
  }

  void changeTheme(String? value) {
    Global.APP_THEME = value ?? 'pink';
    notifyListeners();
  }

  void updateFilter(String filter) {
    searchFilter = filter;
    notifyListeners();
  }
}
