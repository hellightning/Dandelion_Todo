import 'package:dandelion_todo/models/index.dart';
import 'package:dandelion_todo/utils/Global.dart';
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
  // Todo todoInfo = Todo(title: , );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO 单击后显示todo详细信息
      },
      onLongPress: () => {
        // TODO 长按拖拽可以调整顺序
      },
      child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  todoTitle,
                  style: TextStyle(
                      color: Global.THEME_COLOR.mainColor, fontSize: 30),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  todoContent,
                  style: TextStyle(
                      color: Global.THEME_COLOR.textColor, fontSize: 16),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.task_alt,
                      color: Global.THEME_COLOR.mainColor,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete_forever,
                      color: Global.THEME_COLOR.neglected,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.alarm_rounded,
                      color: Global.THEME_COLOR.textColor,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          // constraints: BoxConstraints.loose(Size(300, 150)),
          constraints:
              BoxConstraints(minWidth: 300, maxWidth: 300, minHeight: 150),
          alignment: Alignment.topCenter,
          // color: Colors.grey[200],
          padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: Global.THEME_COLOR.subColor,
              borderRadius: BorderRadius.all(Radius.circular(5.0)))),
    );
  }
}
