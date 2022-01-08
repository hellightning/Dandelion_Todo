// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..nickName = json['nickName'] as String
  ..passWord = json['passWord'] as String
  ..role = json['role'] as num
  ..userId = json['userId'] as num
  ..watchList = json['watchList'] as List<dynamic>;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'nickName': instance.nickName,
      'passWord': instance.passWord,
      'role': instance.role,
      'userId': instance.userId,
      'watchList': instance.watchList,
    };
