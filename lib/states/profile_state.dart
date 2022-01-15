import 'package:dandelion_todo/models/index.dart';
import 'package:flutter/widgets.dart';

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
  List<int> watchList = List.empty(growable: true);

  Future updateUser() async {
    // User = ;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
