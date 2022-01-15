import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dandelion_todo/http/http_error.dart';
import 'package:dandelion_todo/http/rest_api.dart';
import 'package:dandelion_todo/models/todo.dart';
import 'package:dandelion_todo/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

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
  Future<Todo> createTodo(Todo todo) async {
    try {
      var res = await dio.request('/api/todo/$localUid/new',
          options: Options(method: 'POST'), data: todo.toJson());
      var body = json.decode(res.toString());
      if (body["status"] != 200) {
        throw InvalidInputException(body["msg"]);
      }
      var parsed = Todo.fromJson(body["data"]);
      return parsed;
    } on DioError catch (e) {
      if (e.response != null) {
        var body = json.decode(e.response.toString());
        if (body["status"] == 403) {
          try {
            await login(localUid, localPassword);
            return await createTodo(todo);
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
  Future deleteUserTodo(int userId, int todoId, Todo todo) async {
    try {
      var res = await dio.request('/api/todo/$localUid/$todoId',
          options: Options(method: 'DELETE'), data: todo.toJson());
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
            await deleteUserTodo(userId, todoId, todo);
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
  Future<String?> findNicknameById(int userId) async {
    try {
      var res = await dio.request('/api/user/$userId',
          options: Options(method: 'GET'));
      var body = json.decode(res.toString());
      if (body["status"] != 200) {
        throw InvalidInputException(body["msg"]);
      }
      return body["data"]["nickname"];
    } on DioError catch (e) {
      if (e.response != null) {
        var body = json.decode(e.response.toString());
        if (body["status"] == 403) {
          try {
            await login(localUid, localPassword);
            var a = await findNicknameById(userId);
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
  Future<List<int>?> findUserByNickName(String nickname) async {
    try {
      var res = await dio.request('/api/user/search?nickname=$nickname',
          options: Options(method: 'GET'));
      var body = json.decode(res.toString());
      if (body["status"] != 200) {
        throw InvalidInputException(body["msg"]);
      }
      var ans = List<int>.from(body["data"].map((e) => e['userId']));
      return ans;
    } on DioError catch (e) {
      if (e.response != null) {
        var body = json.decode(e.response.toString());
        if (body["status"] == 403) {
          try {
            await login(localUid, localPassword);
            var a = await findUserByNickName(nickname);
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
    try {
      var res = await dio.request('/api/todo/$userId/$todoId',
          options: Options(method: 'GET'));
      var body = json.decode(res.toString());
      if (body["status"] != 200) {
        throw InvalidInputException(body["msg"]);
      }
      var state = body["data"];
      var lstMapped = Todo.fromJson(state);
      return lstMapped;
    } on DioError catch (e) {
      if (e.response != null) {
        var body = json.decode(e.response.toString());
        if (body["status"] == 403) {
          try {
            await login(localUid, localPassword);
            var a = await getUserTodoDetail(userId, todoId);
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
      var q = body['data'];
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
  Future syncTodoList(List<Todo> lst) async {
    try {
      var nlst = List<Map>.from(lst.map((e) => e.toJson()));
      await dio.request('/api/todo/$localUid',
          options: Options(method: 'POST'), data: json.encode(nlst));
    } on DioError catch (e) {
      if (e.response != null) {
        var body = json.decode(e.response.toString());
        if (body["status"] == 403) {
          try {
            await login(localUid, localPassword);
            await syncTodoList(lst);
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
    try {
      var res = await dio.request('/api/todo/$localUid/$todoId',
          options: Options(method: 'PUT'), data: content.toJson());
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
            await updateUserTodo(userId, todoId, content);
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
  Future uploadAvatar(XFile file) async {
    List<int> f = await file.readAsBytes();
    try {
      var res = await http.post(
          Uri.parse('http://sgp.hareru.moe:8080/api/user/4/avatar'),
          headers: {
            'Authorization': dio.options.headers['Authorization'],
            'Content-type': 'image/jpeg',
            'Connection': 'keep-alive',
          },
          body: f);
      if (res.statusCode != 200) {
        if (res.statusCode == 403) {
          await login(localUid, localPassword);
          await uploadAvatar(file);
        } else {
          var msg = json.decode(res.body)["msg"];
          throw InvalidInputException(msg);
        }
      }
    } on Error catch (e) {
      throw NetworkErrorException();
    }
  }

  @override
  Future<List<Todo>> getTodoListWithPage(
      int userId, int limit, int maxId) async {
    try {
      var res = await dio.request(
          '/api/todo/$userId?limit=$limit&max_id=$maxId',
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
  Future<Uint8List> getAvatar(int userId) async {
    try {
      var res = await http.get(
          Uri.parse('http://sgp.hareru.moe:8080/api/user/$userId/avatar'),
          headers: {
            'Authorization': dio.options.headers['Authorization'],
            'Content-type': 'image/jpeg',
            'Connection': 'keep-alive',
          });
      return res.bodyBytes;
    } catch (e) {
      rethrow;
    }
  }
}
