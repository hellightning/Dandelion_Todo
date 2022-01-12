import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User();
  @JsonKey(name:'nickname')
  late String nickName;
  @JsonKey(name:'password')
  late String passWord;
  late List role;
  late num userId;
  late List watchList;
  User._internal (num id, String pass){
    this.userId = id;
    this.passWord = pass;
    this.role = [];
    this.watchList = [];
    this.nickName = "";
  }
  factory User.fromIdPass(num id, String pass) => User._internal(id, pass);
  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
