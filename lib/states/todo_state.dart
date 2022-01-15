import 'package:dandelion_todo/http/rest_api_impl.dart';
import 'package:dandelion_todo/models/todo.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TodoState extends ChangeNotifier {
  List<Todo> todoList = List.empty();
  void updateTodoList() async {
    // await DandelionLauncher.requestTodo().then((value) {
    //   todoList = value;
    // });
    await RestImpl().getTodoList(Global.getUser()).then((value) {
      todoList = value;
    }).catchError((e) {
      print(e);
    });
    notifyListeners();
  }

  List<Todo> friendTodoList = List.empty();
  void updateFriendTodoList() async {
    await RestImpl().findWatchList(Global.getUser()).then((value) {
      for (var friend in value) {
        RestImpl().getTodoList(friend).then((value) {
          friendTodoList.addAll(value);
        }).catchError((e) {
          Fluttertoast.showToast(msg: e.toString());
        });
      }
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }
}
