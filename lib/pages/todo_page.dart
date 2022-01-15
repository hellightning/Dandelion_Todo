import 'dart:io';

import 'package:dandelion_todo/components/my_drawer.dart';
import 'package:dandelion_todo/components/search_item.dart';
import 'package:dandelion_todo/components/todo_item.dart';
import 'package:dandelion_todo/http/rest_api_mock.dart';
import 'package:dandelion_todo/models/todo.dart';
import 'package:dandelion_todo/states/config_state.dart';
import 'package:dandelion_todo/states/todo_state.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// main page
class TodoPage extends StatefulWidget {
  TodoPage(
      {Key? key,
      required this.isUnfinished,
      this.isFriend = false,
      this.currItem = Global.TODO_DRAWER_UNFINISHED})
      : super(key: key);
  bool isUnfinished;
  bool isFriend;
  int currItem;
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // List<TodoProvider> todoList = List.empty(growable: true);
  // TODO: 使用state中的全局数据来初始化
  // List<Todo> todoList = List.empty();
  @override
  void initState() {
    // RestImpl.instance
    //     .getTodoList(Global.getUser())
    //     .catchError((e) {})
    //     .then((value) {
    //   todoList = value;
    // });
    // sleep(Duration(seconds: 5));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<TodoState>(context).updateTodoList();
    return Scaffold(
      drawer: MyDrawer(
        initItem: widget.currItem,
      ),
      backgroundColor: Provider.of<ConfigState>(context).themeColor.background,
      body: Stack(
        children: [
          ListView(
            // FP!!!
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
              )
            ]
                .followedBy((widget.isFriend
                        ? Provider.of<TodoState>(context).friendTodoList
                        : Provider.of<TodoState>(context).todoList)
                    .where((todoData) =>
                        ((todoData.completeAt == 0) == widget.isUnfinished))
                    .where((todoData) => (todoData.title.contains(
                        Provider.of<ConfigState>(context).searchFilter)))
                    .map((todoData) => Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: TodoItem(
                            todoData: todoData,
                            isUnfinished: widget.isUnfinished,
                            isFriend: widget.isFriend,
                          ),
                        )))
                .toList(),
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
