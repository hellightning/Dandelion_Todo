import 'dart:io';
import 'dart:math';

import 'package:dandelion_todo/http/http_error.dart';
import 'package:dandelion_todo/http/rest_api.dart';
import 'package:dandelion_todo/models/todo.dart';
import 'package:dandelion_todo/models/user.dart';
import 'package:image_picker/image_picker.dart';

class RestMock implements RestApi {
  RestMock._internal();
  static final RestMock instance = RestMock._internal();

  factory RestMock() {
    return instance;
  }

  var userMock = const {
    'nickname': 'hhh',
    'password': '114514',
    'role': [
      {'authority': 'ROLE_USER'}
    ],
    'userId': 4,
    'watchList': [0]
  };

  var todoMock = const {
    'completeAt': 0,
    'createdAt': 1641699781012,
    'creatorId': 4,
    'deadline': 1641699782012,
    'description': 'string',
    'importance': 0,
    'localId': '3fa85f64-5717-4562-b3fc-2c963f66afa6',
    'parentId': 0,
    'plantTime': 0,
    'title': 'a title',
    'todoId': 0,
    'updateAt': 1641699781012
  };

  final ImagePicker picker = ImagePicker();
  late File localImage;

  @override
  Future addWatchList(List<int> watchList) async {
    double r = Random().nextDouble();
    await Future.delayed(const Duration(milliseconds: 100));
    if (r > .8) {
      throw NetworkErrorException();
    }
    return;
  }

  @override
  Future<Todo> createTodo(Todo todo) async {
    double r = Random().nextDouble();
    await Future.delayed(const Duration(milliseconds: 100));
    if (r > .8) {
      throw NetworkErrorException();
    }
    return Todo.fromJson(todoMock);
  }

  @override
  Future deleteUserTodo(int userId, int todoId) async {
    double r = Random().nextDouble();
    await Future.delayed(const Duration(milliseconds: 100));
    if (r > .8) {
      throw NetworkErrorException();
    }
    return;
  }

  @override
  Future deleteWatchList(List<int> deleteList) async {
    double r = Random().nextDouble();
    await Future.delayed(const Duration(milliseconds: 100));
    if (r > .8) {
      throw NetworkErrorException();
    }
    return;
  }

  @override
  Future<User?> findDetailById(int userId) async {
    double r = Random().nextDouble();
    await Future.delayed(const Duration(milliseconds: 100));
    if (r > .8) {
      throw InvalidInputException('userId $userId is illegal');
    }
    return User.fromJson(userMock);
  }

  @override
  Future<String?> findNicknameById(int userId) async {
    double r = Random().nextDouble();
    await Future.delayed(const Duration(milliseconds: 100));
    if (r > .8) {
      throw InvalidInputException('userId $userId is illegal');
    }
    return "zyx";
  }

  @override
  Future<List<int>?> findUserByNickName(String nickname) async {
    double r = Random().nextDouble();
    await Future.delayed(const Duration(milliseconds: 100));
    if (r > .8) {
      throw NetworkErrorException();
    }
    return List.from([2, 3]);
  }

  @override
  Future<List<int>> findWatchList(int userId) async {
    double r = Random().nextDouble();
    await Future.delayed(const Duration(milliseconds: 100));
    if (r > .8) {
      throw NetworkErrorException();
    }
    return List.from([3, 4]);
  }

  @override
  Future<List<Todo>> getTodoList(int userId) async {
    double r = Random().nextDouble();
    await Future.delayed(const Duration(milliseconds: 100));
    if (r > .8) {
      throw NetworkErrorException();
    }
    return List.from([Todo.fromJson(todoMock), Todo.fromJson(todoMock)]);
  }

  @override
  Future<Todo> getUserTodoDetail(int userId, int todoId) async {
    double r = Random().nextDouble();
    await Future.delayed(const Duration(milliseconds: 100));
    if (r > .8) {
      throw NetworkErrorException();
    }
    return Todo.fromJson(todoMock);
  }

  @override
  Future login(int userId, String password) async {
    double r = Random().nextDouble();
    await Future.delayed(const Duration(milliseconds: 100));
    if (r > .8) {
      throw InvalidInputException('invalid id $userId');
    }
    return User.fromJson(userMock);
  }

  @override
  Future<User?> register(String nickname, String password) async {
    double r = Random().nextDouble();
    await Future.delayed(const Duration(milliseconds: 100));
    if (r > .8) {
      throw NetworkErrorException();
    }
    return User.fromJson(userMock);
  }

  @override
  Future setAvatar(File image) async {
    double r = Random().nextDouble();
    await Future.delayed(const Duration(milliseconds: 100));
    if (r > .8) {
      throw NetworkErrorException();
    }
    return;
  }

  @override
  Future syncTodoList(List<Todo> lst) async {
    double r = Random().nextDouble();
    await Future.delayed(const Duration(milliseconds: 100));
    if (r > .8) {
      throw NetworkErrorException();
    }
    return;
  }

  @override
  Future updateUserTodo(int userId, int todoId, Todo content) async {
    double r = Random().nextDouble();
    await Future.delayed(const Duration(milliseconds: 100));
    if (r > .8) {
      throw NetworkErrorException();
    }
    return;
  }

  @override
  Future pickUploadAvatar() async {
    final images = await picker.pickImage(source: ImageSource.camera);
    if (images != null) {
      localImage = File(images.path);
    }
    return;
  }

  @override
  Future cameraUploadAvatar() async {
    final images = await picker.pickImage(source: ImageSource.gallery);
    if (images != null) {
      localImage = File(images.path);
    }
    return;
  }

  @override
  Future updateNickname(String newNickname) async {
    double r = Random().nextDouble();
    await Future.delayed(const Duration(milliseconds: 100));
    if (r > .8) {
      throw NetworkErrorException();
    }
    return;
  }

  @override
  Future updatePassword(String password) async {
    double r = Random().nextDouble();
    await Future.delayed(const Duration(milliseconds: 100));
    if (r > .8) {
      throw NetworkErrorException();
    }
    return;
  }

  @override
  Future<List<Todo>> getTodoListWithPage(int userId, int limit, int maxId) {
    return getTodoList(userId);
  }
}
