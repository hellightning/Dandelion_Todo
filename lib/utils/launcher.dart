import 'package:dandelion_todo/http/http_error.dart';
import 'package:dandelion_todo/http/rest_api_mock.dart';
import 'package:dandelion_todo/models/todo.dart';
import 'package:dandelion_todo/utils/Global.dart';

// 登录和启动过程中用到的方法类
class DandelionLauncher {
  /// 登陆操作，返回登陆是否成功
  static Future<bool> login(int userid, String password) async {
    late bool ret;
    if (Global.isLoggedIn()) {
      ret = true;
    } else {
      await RestMock.instance.login(userid, password).then((value) {
        Global.login(userid, password); // 更新本地账号缓存
        ret = true;
        // TODO: 更新profile provider
      }).catchError((e) {
        ret = false;
        if (e is NetworkErrorException) {
          // TODO: 处理不同的错误逻辑
          ;
        } else if (e is LoginFailedException) {
          ;
        }
      });
    }
    return ret;
  }

  static Future<int> register(String nickname, String password) async {
    int ret = -1;
    // TODO: 注册逻辑
    return ret;
  }

  // 启动时获取TodoList
  static List<Todo> requestTodo() {
    throw UnimplementedError();
  }
}
