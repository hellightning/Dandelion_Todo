import 'package:dandelion_todo/components/my_drawer.dart';
import 'package:dandelion_todo/components/search_item.dart';
import 'package:dandelion_todo/components/todo_item.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// main page
class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // List<TodoProvider> todoList = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Global.THEME_COLOR.background,
      body: Stack(
        children: [
          ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TodoItem(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TodoItem(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TodoItem(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TodoItem(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TodoItem(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TodoItem(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TodoItem(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TodoItem(),
              ),
            ],
          ),
          SearchItem(),
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () => {}, child: Icon(Icons.add)),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
