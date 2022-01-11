import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/widgets.dart';
import 'package:dandelion_todo/utils/themes.dart';

class ThemeState extends ChangeNotifier {
  AppTheme get currTheme => Global.APP_THEME;
  set currTheme(AppTheme value) {
    currTheme = value;
    Global.APP_THEME = currTheme;
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
