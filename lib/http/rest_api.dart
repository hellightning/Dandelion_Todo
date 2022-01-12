import 'dart:io';

import 'package:dandelion_todo/models/todo.dart';
import 'package:dandelion_todo/models/user.dart';

abstract class RestUser {
  Future<User?> register(String nickname, String password);
  Future login(int userId, String password);
  Future<List<User>?> findUserByNickName(String nickname);
  Future<User?> findInfoById(int userId);
  Future pickUploadAvatar();
  Future cameraUploadAvatar();
  Future setAvatar(File image);
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
  Future createTodo(Todo todo);
  Future<Todo> getUserTodoDetail(int userId, int todoId);
  Future updateUserTodo(int userId, int todoId, Todo content);
  Future deleteUserTodo(int userId, int todoId, Todo content);
}

abstract class RestApi implements RestUser, RestTodo {}