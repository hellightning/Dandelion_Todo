// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Setting _$SettingFromJson(Map<String, dynamic> json) => Setting()
  ..theme = json['theme'] as String
  ..unfinished = json['unfinished'] as bool;

Map<String, dynamic> _$SettingToJson(Setting instance) => <String, dynamic>{
      'theme': instance.theme,
      'unfinished': instance.unfinished,
    };
