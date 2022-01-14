import 'dart:io';
import 'dart:typed_data';

import 'package:dandelion_todo/models/todo.dart';
import 'package:dandelion_todo/models/user.dart';
import 'package:image_picker/image_picker.dart';

abstract class RestUser {
  Future<User?> register(String nickname, String password);
  Future login(int userId, String password);
  Future<List<int>?> findUserByNickName(String nickname);
  Future<String?> findNicknameById(int userId);
  Future uploadAvatar(XFile file);
  Future<Uint8List> getAvatar(int userId);
  Future<User?> findDetailById(int userId);
  Future updateNickname(String newNickname);
  Future updatePassword(String password);
  Future<List<int>> findWatchList(int userId);
  Future addWatchList(List<int> watchList);
  Future deleteWatchList(List<int> deleteList);
}

abstract class RestTodo {
  Future<List<Todo>> getTodoList(int userId);
  Future<List<Todo>> getTodoListWithPage(int userId, int limit, int maxId);
  Future syncTodoList(List<Todo> lst);
  Future<Todo> createTodo(Todo todo);
  Future<Todo> getUserTodoDetail(int userId, int todoId);
  Future updateUserTodo(int userId, int todoId, Todo content);
  Future deleteUserTodo(int userId, int todoId, Todo todo);
}

abstract class RestApi implements RestUser, RestTodo {}