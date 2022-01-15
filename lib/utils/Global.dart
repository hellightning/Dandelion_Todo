// ignore_for_file: file_names, constant_identifier_names

import 'dart:typed_data';

import 'package:dandelion_todo/http/http_error.dart';
import 'package:dandelion_todo/http/rest_api_impl.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'themes.dart';

// global类管理全局变量
class Global {
  // SharedPreference实现账号本地存储
  static SharedPreferences? _pref;
  static List<int> WATCHLIST_DYNAMIC = List.empty(growable: true);
  static Uint8List AVATAR_DYNAMIC = Uint8List(0);
  static int getUser() {
    return _pref?.getInt('userid') ?? 0;
  }

  static String getPassword() {
    return _pref?.getString('password') ?? 'null';
  }

  static String getNickname() {
    return _pref?.getString('nickname') ?? 'dandelion';
  }

  static Future updateNickname(String nickname) async {
    RestImpl().updateNickname(nickname).then((_) {
      _pref?.setString('nickname', nickname);
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  static Future updatePassword(String password) async {
    RestImpl().updatePassword(password).then((_) {
      _pref?.setString('password', password);
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  static Future uploadAvatar(XFile avt) async {
    RestImpl().uploadAvatar(avt).then((_) {
      return RestImpl().getAvatar(getUser());
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    }).then((value) {
      AVATAR_DYNAMIC = value;
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  static Future updateWatchlistByUserid(int userid) async {
    print(WATCHLIST_DYNAMIC.toString());
    RestImpl().addWatchList(List.from([userid])).then((_) {
      WATCHLIST_DYNAMIC.add(userid);
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  static Future updateWatchlistByNickname(String nickname) async {
    RestImpl().findUserByNickName(nickname).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    }).then((value) {
      RestImpl().addWatchList(value ?? List.empty()).then((_) {
        WATCHLIST_DYNAMIC.addAll(value ?? List.empty());
      }).catchError((e) {
        Fluttertoast.showToast(msg: e.toString());
      });
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  static Future<bool> login(int userid, String password) async {
    late bool ret;
    await RestImpl()
        .login(userid, password)
        .then((value) {
          _pref?.setInt('userid', userid);
          _pref?.setString('password', password);
          ret = true;
        })
        .catchError((e) {
          ret = false;
          if (e is NetworkErrorException) {
            // TODO: 处理不同的错误逻辑
            Fluttertoast.showToast(msg: e.toString());
          } else if (e is LoginFailedException) {
            Fluttertoast.showToast(msg: e.toString());
          }
        })
        .then((_) {
          return RestImpl().findNicknameById(userid);
        })
        .then((value) {
          _pref?.setString('nickname', value ?? 'dandelion');
        })
        .catchError((e) {
          Fluttertoast.showToast(msg: e.toString());
        })
        .then((_) {
          return RestImpl().findWatchList(userid);
        })
        .then((value) {
          WATCHLIST_DYNAMIC = value;
          print(WATCHLIST_DYNAMIC.toString());
        })
        .catchError((e) {
          Fluttertoast.showToast(msg: e.toString());
        })
        .then((_) {
          return RestImpl().getAvatar(userid);
        })
        .then((value) {})
        .catchError((e) {
          Fluttertoast.showToast(msg: e.toString());
        });
    return ret;
  }

  static void logout() {
    _pref?.remove('userid');
  }

  static Future<bool> isLoggedIn() async {
    if (_pref?.getInt('userid') == null ||
        _pref?.getString('password') == null) {
      return false;
    } else {
      return login(
          _pref!.getInt('userid') ?? 0, _pref!.getString('password') ?? '');
    }
  }

  static Future<int> register(String nickname, String password) async {
    int ret = -1;
    await RestImpl().register(nickname, password).catchError((e) {
      print(e);
    }).then((value) {
      Global.login(value?.userId as int, value!.password);
      ret = value.userId as int;
    });
    return ret;
  }

  // 数字常量
  static const TODO_DRAWER_UNFINISHED = 0;
  static const TODO_DRAWER_FINISHED = 1;
  static const TODO_DRAWER_CONFIG = 2;
  static const TODO_DRAWER_FRIENDTODO = 3;
  static const TODO_DRAWER_ADDFRIEND = 4;
  static const TODO_DRAWER_CHANGETHEME = 5;
  static const TODO_DRAWER_LOGOUT = 6;
  static const TODO_DRAWER_HELP = 7;
  static const TODO_DRAWER_SUGGEST = 8;

  static const APPBAR_TITLE_SIZE = 20.0;
  static const TODO_TITLE_SIZE = 30.0;
  static const NORMAL_TEXT_SIZE = 16.0;

  // 字符常量
  static const IMPORTANCE_DES = {0: '随缘', 1: '一般', 2: '重要', 3: '非常重要'};

  // theme colors
  static String? APP_THEME;
  static String get appTheme {
    if (_pref?.getString('theme') == null) {
      _pref?.setString('theme', 'dark');
    }
    APP_THEME ??= _pref!.getString('theme')!;
    return APP_THEME!;
  }

  static set setAppTheme(String at) {
    try {
      Global.APP_THEME = at;
      _pref?.setString('theme', at);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _pref = await SharedPreferences.getInstance();
  }

  // static const TodoTitleStyle = TextStyle(color: );
}
