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
    return Container(
      constraints:
          const BoxConstraints(minWidth: 300, maxWidth: 300, minHeight: 150),
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Global.THEME_COLOR.subColor,
        boxShadow: <BoxShadow>[
          BoxShadow(blurRadius: 2.0, color: Global.THEME_COLOR.neglected),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Material(
        color: Global.THEME_COLOR.subColor,
        type: MaterialType.button,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: InkWell(
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
                            constraints: const BoxConstraints(maxWidth: 200),
                            child: Text(
                              'Deadline: ' +
                                  formatDate(
                                      DateTime.fromMicrosecondsSinceEpoch(
                                          todoData.deadline as int),
                                      [yyyy, '-', mm, '-', dd]),
                              style: TextStyle(
                                  color: (todoData.deadline -
                                              DateTime.now()
                                                  .millisecondsSinceEpoch <=
                                          86400000)
                                      ? Global.THEME_COLOR.warnColor
                                      : Global.THEME_COLOR.neglected),
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
                            await RestMock.instance
                                .updateUserTodo(Global.getUser(),
                                    todoData.todoId as int, todoData)
                                .catchError((e) {
                              print(e);
                            });
                            // TODO: 修修逻辑
                            Provider.of<TodoState>(context, listen: false)
                                .updateTodoList();
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete_forever,
                            color: Global.THEME_COLOR.warnColor,
                          ),
                          onPressed: () {
                            RestMock.instance
                                .deleteUserTodo(Global.getUser(),
                                    todoData.todoId as int, todoData)
                                .catchError((e) {
                              print(e);
                            });
                            // TODO: 修修逻辑
                            Provider.of<TodoState>(context, listen: false)
                                .updateTodoList();
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
                                  color: Global.THEME_COLOR.neglected),
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
        ),
      ),
    );
  }
}
