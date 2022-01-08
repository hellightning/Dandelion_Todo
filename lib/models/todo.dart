import 'package:json_annotation/json_annotation.dart';
import "time_stamp.dart";
part 'todo.g.dart';

@JsonSerializable()
class Todo {
  Todo();

  late Time_stamp completeAt;
  late Time_stamp createdAt;
  late num creatorId;
  late Time_stamp deadline;
  late String description;
  late num localId;
  late num parentId;
  late num plantTime;
  late String title;
  late num todoId;
  late Time_stamp updateAt;
  
  factory Todo.fromJson(Map<String,dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
