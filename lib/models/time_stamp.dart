import 'package:json_annotation/json_annotation.dart';
part 'time_stamp.g.dart';

@JsonSerializable()
class Time_stamp {
  Time_stamp();

  late DateTime timeDateObj;
  late num year;
  late num month;
  late num date;
  late num hour;
  late num minute;
  late num second;
  late num nanos;

  factory Time_stamp.fromJson(Map<String, dynamic> json) =>
      _$Time_stampFromJson(json);
  Map<String, dynamic> toJson() => _$Time_stampToJson(this);
}
