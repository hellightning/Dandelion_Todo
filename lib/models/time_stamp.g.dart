// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_stamp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Time_stamp _$Time_stampFromJson(Map<String, dynamic> json) => Time_stamp()
  ..timeDateObj = DateTime.parse(json['timeDateObj'] as String)
  ..year = json['year'] as num
  ..month = json['month'] as num
  ..date = json['date'] as num
  ..hour = json['hour'] as num
  ..minute = json['minute'] as num
  ..second = json['second'] as num
  ..nanos = json['nanos'] as num;

Map<String, dynamic> _$Time_stampToJson(Time_stamp instance) =>
    <String, dynamic>{
      'timeDateObj': instance.timeDateObj.toIso8601String(),
      'year': instance.year,
      'month': instance.month,
      'date': instance.date,
      'hour': instance.hour,
      'minute': instance.minute,
      'second': instance.second,
      'nanos': instance.nanos,
    };
