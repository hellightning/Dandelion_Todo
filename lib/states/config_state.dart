import 'package:dandelion_todo/utils/themes.dart';
import 'package:flutter/cupertino.dart';

class ConfigState extends ChangeNotifier {
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
