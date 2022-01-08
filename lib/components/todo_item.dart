import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 首页显示TODO缩略信息的Widget
class TodoItem extends StatefulWidget {
  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('this is a todo item'),
      color: Colors.blue,
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      margin: EdgeInsets.all(5),
    );
  }
}
