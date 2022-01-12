import 'package:dandelion_todo/models/index.dart';

class TodoFunction {
  static List<Todo> query(List<Todo> todolist, bool filter(Todo todoitem)) {
    return todolist;
  }

  static void sort(List<Todo> todolist, int weight(Todo todoitem)) {
    ;
  }
}
