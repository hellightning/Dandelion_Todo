// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..nickName = json['nickname'] as String
  ..passWord = json['password'] as String
  ..role = json['role'] as List<dynamic>
  ..userId = json['userId'] as num
  ..watchList = json['watchList'] as List<dynamic>;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'nickname': instance.nickName,
      'password': instance.passWord,
      'role': instance.role,
      'userId': instance.userId,
      'watchList': instance.watchList,
    };
