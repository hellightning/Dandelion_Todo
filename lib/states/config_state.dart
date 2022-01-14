import 'package:dandelion_todo/utils/Global.dart';
import 'package:dandelion_todo/utils/themes.dart';
import 'package:flutter/cupertino.dart';

class ConfigState extends ChangeNotifier {
  String theme = 'blue';
  ConfigState() {
    theme = Global.APP_THEME;
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
