import 'package:dandelion_todo/models/index.dart';
import 'package:flutter/widgets.dart';

/// 好像没什么用...先留着吧
/// 账号管理比较简单（单用户登录）的情况下没有必要使用
class ProfileState extends ChangeNotifier {
  // ProfileState({required this.userModel}) {
  //   userid = userModel.userId as int;
  //   nickname = userModel.nickname;
  //   password = userModel.password;
  // }
  User? userModel;
  int userid = 0;
  String nickname = '';
  String password = '';

  Future updateUser() async {
    // User = ;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
