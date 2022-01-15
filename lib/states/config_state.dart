import 'package:dandelion_todo/utils/Global.dart';
import 'package:dandelion_todo/utils/themes.dart';
import 'package:flutter/cupertino.dart';

class ConfigState extends ChangeNotifier {
  String theme = AppTheme.dark;
  String searchFilter = '';
  set setTheme(String thm) {
    theme = thm;
  }

  ThemeColor get themeColor {
    return ThemeColor.themeMap[theme]!;
  }

  ConfigState() {
    theme = Global.appTheme;
  }
  late AppTheme currentTheme;
  @override
  void notifyListeners() {
    super.notifyListeners();
  }

  changeTheme(AppTheme newTheme) {
    currentTheme = newTheme;
    notifyListeners();
  }
}
