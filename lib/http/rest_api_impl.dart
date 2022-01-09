import 'dart:io';
import 'dart:math';

import 'package:dandelion_todo/http/http_error.dart';
import 'package:dandelion_todo/http/rest_api.dart';
import 'package:dandelion_todo/models/todo.dart';
import 'package:dandelion_todo/models/user.dart';
import 'package:image_picker/image_picker.dart';

class RestImpl implements RestUser, RestTodo {

  final ImagePicker picker = ImagePicker();
  late File localImage;

  @override
  Future addWatchList(List<int> watchList) async{
    throw UnimplementedError();
  }

  @override
  Future createTodo(Todo todo) async{
    throw UnimplementedError();
  }

  @override
  Future deleteUserTodo(int userId, int todoId, Todo content) async {
    throw UnimplementedError();
  }

  @override
  Future deleteWatchList(List<int> deleteList) async {
    throw UnimplementedError();
  }

  @override
  Future<User?> findDetailById(int userId) async {
    throw UnimplementedError();
  }

  @override
  Future<User?> findInfoById(int userId) async {
    throw UnimplementedError();
  }

  @override
  Future<List<User>?> findUserByNickName(String nickname) async {
    throw UnimplementedError();
  }

  @override
  Future<List<int>> findWatchList(int userId) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getTodoList(int userId) async {
    throw UnimplementedError();
  }

  @override
  Future<Todo> getUserTodoDetail(int userId, int todoId) async {
    throw UnimplementedError();
  }

  @override
  Future<User?> login(int userId, String password) async {
    throw UnimplementedError();
  }

  @override
  Future<User?> register(String nickname, String password) async {
    throw UnimplementedError();
  }

  @override
  Future setAvatar(File image) async {
    throw UnimplementedError();
  }

  @override
  Future syncTodoList(List<Todo> lst) async {
    throw UnimplementedError();
  }

  @override
  Future updateDetailInfo(User userInfo) async {
    throw UnimplementedError();
  }

  @override
  Future updateUserTodo(int userId, int todoId, Todo content) async {
    throw UnimplementedError();
  }

  @override
  Future pickUploadAvatar() async {
    throw UnimplementedError();
  }

  @override
  Future cameraUploadAvatar() async{
    throw UnimplementedError();
  }

}