import 'dart:io';

import 'package:dandelion_todo/components/my_drawer.dart';
import 'package:dandelion_todo/components/search_item.dart';
import 'package:dandelion_todo/components/todo_item.dart';
import 'package:dandelion_todo/http/rest_api_mock.dart';
import 'package:dandelion_todo/models/todo.dart';
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
  List<Todo> todoList = List.empty();
  @override
  void initState() {
    RestMock.instance.getTodoList(Global.getUser()).then((value) {
      todoList = value;
    });
    // sleep(Duration(seconds: 5));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Global.THEME_COLOR.background,
      body: Stack(
        children: [
          ListView(
            children: /*<Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
              )
            ]
                .followedBy*/
                (todoList.map((todoData) => Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: TodoItem(
                        todoData: todoData,
                      ),
                    ))).toList(),
          ),
          SearchItem(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/edit_page/add'),
          child: const Icon(Icons.add)),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
