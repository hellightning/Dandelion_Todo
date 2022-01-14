import 'package:dandelion_todo/http/rest_api_mock.dart';
import 'package:dandelion_todo/models/todo.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:dandelion_todo/utils/launcher.dart';
import 'package:flutter/widgets.dart';

class TodoState extends ChangeNotifier {
  List<Todo> todoList = List.empty();
  void updateTodoList() async {
    // await DandelionLauncher.requestTodo().then((value) {
    //   todoList = value;
    // });
    await RestMock.instance.getTodoList(Global.getUser()).then((value) {
      todoList = value;
    }).catchError((e) {
      print(e);
    });
    notifyListeners();
  }

  // @override
  // void notifyListeners() {
  //   super.notifyListeners();
  // }
}
