// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) => Config()
  ..theme = json['theme'] as String
  ..someSetting = json['someSetting'] as bool;

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'theme': instance.theme,
      'someSetting': instance.someSetting,
    };
