import 'package:dandelion_todo/models/index.dart';
import 'package:flutter/widgets.dart';

class ProfileState extends ChangeNotifier {
  // ProfileState({required this.userModel}){
  // TODO: 从User类中获取剩下的
  // }
  late User userModel;
  late int userid;
  late int nickname;
  late String password;
  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
