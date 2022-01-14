import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  late String nickname;
  late String password;
  late List role;
  late num userId;
  late List watchList;
  User._internal (num id, String pass){
    userId = id;
    password = pass;
    role = [];
    watchList = [];
    nickname = "";
  }
  factory User.fromIdPass(num id, String pass) => User._internal(id, pass);
  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
