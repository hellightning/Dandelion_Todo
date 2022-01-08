// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo()
  ..completeAt = Time_stamp.fromJson(json['completeAt'] as Map<String, dynamic>)
  ..createdAt = Time_stamp.fromJson(json['createdAt'] as Map<String, dynamic>)
  ..creatorId = json['creatorId'] as num
  ..deadline = Time_stamp.fromJson(json['deadline'] as Map<String, dynamic>)
  ..description = json['description'] as String
  ..localId = json['localId'] as num
  ..parentId = json['parentId'] as num
  ..plantTime = json['plantTime'] as num
  ..title = json['title'] as String
  ..todoId = json['todoId'] as num
  ..updateAt = Time_stamp.fromJson(json['updateAt'] as Map<String, dynamic>);

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'completeAt': instance.completeAt,
      'createdAt': instance.createdAt,
      'creatorId': instance.creatorId,
      'deadline': instance.deadline,
      'description': instance.description,
      'localId': instance.localId,
      'parentId': instance.parentId,
      'plantTime': instance.plantTime,
      'title': instance.title,
      'todoId': instance.todoId,
      'updateAt': instance.updateAt,
    };
