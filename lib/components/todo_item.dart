import 'package:dandelion_todo/http/rest_api_mock.dart';
import 'package:dandelion_todo/models/index.dart';
import 'package:dandelion_todo/pages/planttree_page.dart';
import 'package:dandelion_todo/pages/todo_edit_page.dart';
import 'package:dandelion_todo/states/todo_state.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:provider/provider.dart';

// 首页显示TODO缩略信息的Widget
class TodoItem extends StatelessWidget {
  TodoItem({Key? key, required this.todoData, this.isUnfinished = true})
      : super(key: key);
  Todo todoData;
  bool isUnfinished;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TodoEditPage(
              todoData: todoData,
            ),
          ),
        );
      },
      onLongPress: () => {
        // TODO 长按拖拽可以调整顺序
      },
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                todoData.title,
                style: TextStyle(
                    color: Global.THEME_COLOR.mainColor,
                    fontSize: Global.TODO_TITLE_SIZE),
              ),
            ),
            Divider(
              color: Global.THEME_COLOR.neglected,
              thickness: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                todoData.description,
                style: TextStyle(
                    color: Global.THEME_COLOR.textColor,
                    fontSize: Global.NORMAL_TEXT_SIZE),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: isUnfinished
                  ? <Widget>[
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          constraints: const BoxConstraints(maxWidth: 100),
                          child: Text(
                            'Deadline: ' +
                                formatDate(
                                    DateTime.fromMicrosecondsSinceEpoch(
                                        todoData.deadline as int),
                                    [yyyy, '-', mm, '-', dd]),
                            style: TextStyle(
                                color: /*isNearDeadline? warn : neglected*/ Global
                                    .THEME_COLOR.neglected),
                          ),
                        ),
                      ),
                      const Flexible(
                        fit: FlexFit.tight,
                        child: SizedBox(),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.task_alt,
                          color: Global.THEME_COLOR.mainColor,
                        ),
                        onPressed: () async {
                          todoData.completeAt =
                              DateTime.now().microsecondsSinceEpoch;
                          await RestMock.instance.updateUserTodo(
                              Global.getUser(),
                              todoData.todoId as int,
                              todoData);
                          Provider.of<TodoState>(context).updateTodoList();
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete_forever,
                          color: Global.THEME_COLOR.warnColor,
                        ),
                        onPressed: () {
                          RestMock.instance.deleteUserTodo(Global.getUser(),
                              todoData.todoId as int, todoData);
                          Provider.of<TodoState>(context).updateTodoList();
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.alarm_rounded,
                          color: Global.THEME_COLOR.textColor,
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlanttreePage(
                              todoData: todoData,
                            ),
                          ),
                        ),
                      ),
                    ]
                  : <Widget>[
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          constraints: const BoxConstraints(maxWidth: 100),
                          child: Text(
                            'Completed: ' +
                                formatDate(
                                    DateTime.fromMicrosecondsSinceEpoch(
                                        todoData.completeAt as int),
                                    [yyyy, '-', mm, '-', dd]),
                            style: TextStyle(
                                color: /*isNearDeadline? warn : neglected*/ Global
                                    .THEME_COLOR.neglected),
                          ),
                        ),
                      ),
                      const Flexible(
                        fit: FlexFit.tight,
                        child: SizedBox(),
                      ),
                    ],
            ),
          ],
        ),
        // constraints: BoxConstraints.loose(Size(300, 150)),
        constraints:
            const BoxConstraints(minWidth: 300, maxWidth: 300, minHeight: 150),
        alignment: Alignment.topCenter,
        // color: Colors.grey[200],
        padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Global.THEME_COLOR.subColor,
          boxShadow: <BoxShadow>[
            BoxShadow(blurRadius: 2.0, color: Global.THEME_COLOR.neglected),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          // border: Border(
          //     bottom: BorderSide(
          //         color: Global.THEME_COLOR.neglected,
          //         width: 2.0,
          //         style: BorderStyle.solid),
          //     right: BorderSide(
          //         color: Global.THEME_COLOR.neglected,
          //         width: 2.0,
          //         style: BorderStyle.solid)),
        ),
      ),
    );
  }
}
