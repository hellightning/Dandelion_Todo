import 'package:dandelion_todo/components/todo_item.dart';
import 'package:dandelion_todo/models/todo.dart';

// 登录和启动过程中用到的方法类
class Launcher {
  // 检验是否已经有登陆数据
  bool verifyLogin() {
    return true;
  }

  // 检验是否登陆成功
  bool isLoginSuccess(String id, String password) {
    return true;
  }

  // 启动时获取TodoList
  List<Todo> requestTodo() {
    throw UnimplementedError();
  }

  // 将Todo数据类装载为Widget
  TodoItem implementTodo(Todo todo) {
    throw UnimplementedError();
  }
}
