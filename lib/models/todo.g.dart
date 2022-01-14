// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo()
  ..completeAt = json['completeAt'] as num
  ..createAt = json['createAt'] as num
  ..creatorId = json['creatorId'] as num
  ..deadline = json['deadline'] as num
  ..description = json['description'] as String
  ..importance = json['importance'] as int
  ..localId = json['localId'] as String
  ..parentId = json['parentId'] as num
  ..plantTime = json['plantTime'] as num
  ..title = json['title'] as String
  ..todoId = json['todoId'] as num
  ..updateAt = json['updateAt'] as num;

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'completeAt': instance.completeAt,
      'createAt': instance.createAt,
      'creatorId': instance.creatorId,
      'deadline': instance.deadline,
      'description': instance.description,
      'importance': instance.importance,
      'localId': instance.localId,
      'parentId': instance.parentId,
      'plantTime': instance.plantTime,
      'title': instance.title,
      'todoId': instance.todoId,
      'updateAt': instance.updateAt,
    };
