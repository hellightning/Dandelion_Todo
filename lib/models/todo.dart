import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  Todo();

  late num completeAt;
  late num createdAt;
  late num creatorId;
  late num deadline;
  late String description;
  late num localId;
  late num parentId;
  late num plantTime;
  late String title;
  late num todoId;
  late num updateAt;
  
  factory Todo.fromJson(Map<String,dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
