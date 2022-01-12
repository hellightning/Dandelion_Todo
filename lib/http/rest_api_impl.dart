import 'dart:io';
import 'dart:convert';

import 'package:dandelion_todo/http/http_error.dart';
import 'package:dandelion_todo/http/rest_api.dart';
import 'package:dandelion_todo/models/todo.dart';
import 'package:dandelion_todo/models/user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class RestImpl implements RestApi {
  static final RestImpl _instance = RestImpl._internal();
  var dio = Dio();
  late String localNickname;
  late String localPassword;
  late int localUid;

  RestImpl._internal() {
    dio.options.baseUrl = "http://sgp.hareru.moe:8080/";
    dio.options.connectTimeout = 5000; //超时时间
    dio.options.receiveTimeout = 3000; //接收数据最长时间
    dio.options.responseType = ResponseType.json; //数据格式
  }

  factory RestImpl() {
    return _instance;
  }

  final ImagePicker picker = ImagePicker();
  late File localImage;

  @override
  Future addWatchList(List<int> watchList) async {
    try {
      var res = await dio.request('/api/user/$localUid/watchlist',
          options: Options(method: 'POST'), data: {'watchList': watchList});
      var body = json.decode(res.toString());
      if (body["status"] != 200) {
        throw InvalidInputException(body["msg"]);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        var body = json.decode(e.response.toString());
        if (body["status"] == 403) {
          try {
            await login(localUid, localPassword);
            await addWatchList(watchList);
          } catch (e) {
            throw NetworkErrorException();
          }
        } else {
          throw LoginFailedException(body['msg']);
        }
      } else {
        throw NetworkErrorException();
      }
    }
  }

  @override
  Future createTodo(Todo todo) async {
    throw UnimplementedError();
  }

  @override
  Future deleteUserTodo(int userId, int todoId, Todo content) async {
    throw UnimplementedError();
  }

  @override
  Future deleteWatchList(List<int> deleteList) async {
    try {
      var res = await dio.request('/api/user/$localUid/watchlist',
          options: Options(method: 'DELETE'), data: {'watchList': deleteList});
      var body = json.decode(res.toString());
      if (body["status"] != 200) {
        throw InvalidInputException(body["msg"]);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        var body = json.decode(e.response.toString());
        if (body["status"] == 403) {
          try {
            await login(localUid, localPassword);
            await deleteWatchList(deleteList);
          } catch (e) {
            throw NetworkErrorException();
          }
        } else {
          throw LoginFailedException(body['msg']);
        }
      } else {
        throw NetworkErrorException();
      }
    }
  }

  @override
  Future<User?> findDetailById(int userId) async {
    try {
      var res = await dio.request('/api/user/$localUid/detail',
          options: Options(method: 'GET'));
      var body = json.decode(res.toString());
      if (body["status"] != 200) {
        throw InvalidInputException(body["msg"]);
      }
      var usr = User.fromJson(body["data"]);
      localNickname = usr.nickname;
      return usr;
    } on DioError catch (e) {
      if (e.response != null) {
        var body = json.decode(e.response.toString());
        if (body["status"] == 403) {
          try {
            await login(localUid, localPassword);
            var a = await findDetailById(userId);
            return a;
          } catch (e) {
            throw NetworkErrorException();
          }
        } else {
          throw LoginFailedException(body['msg']);
        }
      } else {
        throw NetworkErrorException();
      }
    }
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
    try {
      var res = await dio.request('/api/user/$localUid/watchlist',
          options: Options(method: 'GET'));
      var body = json.decode(res.toString());
      if (body["status"] != 200) {
        throw InvalidInputException(body["msg"]);
      }
      var numb = List<int>.from(body["data"].map((e) {
        return e;
      }));
      return numb;
    } on DioError catch (e) {
      if (e.response != null) {
        var body = json.decode(e.response.toString());
        if (body["status"] == 403) {
          try {
            await login(localUid, localPassword);
            var a = await findWatchList(userId);
            return a;
          } catch (e) {
            throw NetworkErrorException();
          }
        } else {
          throw LoginFailedException(body['msg']);
        }
      } else {
        throw NetworkErrorException();
      }
    }
  }

  @override
  Future<List<Todo>> getTodoList(int userId) async {
    try {
      var res = await dio.request('/api/todo/$localUid',
          options: Options(method: 'GET'));
      var body = json.decode(res.toString());
      if (body["status"] != 200) {
        throw InvalidInputException(body["msg"]);
      }
      var stateLst = body["data"];
      var lstMapped = List<Todo>.from(stateLst.map((e) => Todo.fromJson(e)));
      return lstMapped;
    } on DioError catch (e) {
      if (e.response != null) {
        var body = json.decode(e.response.toString());
        if (body["status"] == 403) {
          try {
            await login(localUid, localPassword);
            var a = await getTodoList(userId);
            return a;
          } catch (e) {
            throw NetworkErrorException();
          }
        } else {
          throw LoginFailedException(body['msg']);
        }
      } else {
        throw NetworkErrorException();
      }
    }
  }

  @override
  Future<Todo> getUserTodoDetail(int userId, int todoId) async {
    throw UnimplementedError();
  }

  @override
  Future login(int userId, String password) async {
    try {
      var res = await dio.request('/login?userId=$userId&password=$password',
          options: Options(method: 'POST'));
      var body = json.decode(res.toString());
      dio.options.headers['Authorization'] = body['data'];
      localUid = userId;
      localPassword = password;
    } on DioError catch (e) {
      if (e.response != null) {
        var body = json.decode(e.response.toString());
        throw LoginFailedException(body['msg']);
      } else {
        throw NetworkErrorException();
      }
    }
  }

  @override
  Future<User?> register(String nickname, String password) async {
    try {
      var res = await dio.request('/register',
          options: Options(method: 'POST'),
          data: {'nickname': nickname, 'password': password});
      var body = json.decode(res.toString());
      var currUser = User.fromJson(body['data']);
      localNickname = nickname;
      localUid = currUser.userId as int;
      localPassword = password;
      return currUser;
    } on DioError catch (e) {
      throw NetworkErrorException(e.message);
    }
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
  Future updateNickname(String newNickname) async {
    try {
      var res = await dio.request('/api/user/$localUid/detail',
          options: Options(method: 'POST'),
          data: {'userId': localUid, 'nickname': newNickname});
      var body = json.decode(res.toString());
      if (body["status"] != 200) {
        throw InvalidInputException(body["msg"]);
      }
      var usr = User.fromJson(body["data"]);
      localNickname = newNickname;
      return usr;
    } on DioError catch (e) {
      if (e.response != null) {
        var body = json.decode(e.response.toString());
        if (body["status"] == 403) {
          try {
            await login(localUid, localPassword);
            var a = await updateNickname(newNickname);
            return a;
          } catch (e) {
            throw NetworkErrorException();
          }
        } else {
          throw LoginFailedException(body['msg']);
        }
      } else {
        throw NetworkErrorException();
      }
    }
  }

  @override
  Future updatePassword(String password) async {
    try {
      var res = await dio.request('/api/user/$localUid/detail',
          options: Options(method: 'POST'),
          data: {'userId': localUid, 'password': password});
      var body = json.decode(res.toString());
      if (body["status"] != 200) {
        throw InvalidInputException(body["msg"]);
      }
      var usr = User.fromJson(body["data"]);
      localPassword = password;
      return usr;
    } on DioError catch (e) {
      if (e.response != null) {
        var body = json.decode(e.response.toString());
        if (body["status"] == 403) {
          try {
            await login(localUid, localPassword);
            var a = await updatePassword(password);
            return a;
          } catch (e) {
            throw NetworkErrorException();
          }
        } else {
          throw LoginFailedException(body['msg']);
        }
      } else {
        throw NetworkErrorException();
      }
    }
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
  Future cameraUploadAvatar() async {
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getTodoListWithPage(int userId, int limit, int maxId) {
    // TODO: implement getTodoListWithPage
    throw UnimplementedError();
  }
}
