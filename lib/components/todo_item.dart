import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 首页显示TODO缩略信息的Widget
class TodoItem extends StatefulWidget {
  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  // component of todo
  String todoTitle = "Test Title";
  String todoContent = "test content test content test content test content";
  int importance = 0;
  DateTime fromTime = DateTime.now();
  DateTime toTime = DateTime(2099);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onLongPress: () => {},
      child: Container(
          child: Row(
            children: [
              Icon(Icons.mark_chat_read_rounded),
              Column(
                children: [
                  Text(
                    todoTitle,
                    style: TextStyle(color: Colors.blue[400], fontSize: 20),
                  ),
                  Text(todoContent)
                ],
              ),
            ],
          ),
          width: 300,
          height: 75,
          alignment: Alignment.topCenter,
          // color: Colors.grey[200],
          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.blue[100], boxShadow: [
            BoxShadow(
                blurRadius: 5.0, offset: Offset(5.0, 5.0), color: Colors.grey)
          ])),
    );
  }
}
