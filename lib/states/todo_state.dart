import 'package:dandelion_todo/http/rest_api_impl.dart';
import 'package:dandelion_todo/models/todo.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TodoState extends ChangeNotifier {
  TodoState() {
    updateTodoList();
    updateFriendTodoList();
  }
  List<Todo> todoList = List.empty();
  void addTodo(Todo todoData) {
    todoList.add(todoData);
    notifyListeners();
  }

  void updateTodo(Todo todoData) {
    todoList.removeWhere((todo) => todo.todoId == todoData.todoId);
    addTodo(todoData);
  }

  void updateTodoList() async {
    await RestImpl().getTodoList(Global.getUser()).then((value) {
      todoList = value;
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
    notifyListeners();
  }

  List<Todo> friendTodoList = List.empty(growable: true);
  void updateFriendTodoList() async {
    await RestImpl().findWatchList(Global.getUser()).then((value) {
      for (var friend in value) {
        if (friend == Global.getUser()) {
          continue;
        }
        RestImpl().getTodoList(friend).then((value) {
          friendTodoList.addAll(value);
        }).catchError((e) {
          Fluttertoast.showToast(msg: e.toString());
        });
      }
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
    notifyListeners();
  }
}
