import 'package:dandelion_todo/models/todo.dart';
import 'package:dandelion_todo/utils/launcher.dart';
import 'package:flutter/widgets.dart';

class TodoState extends ChangeNotifier {
  List<Todo> get todolist => DandelionLauncher.requestTodo();
  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
