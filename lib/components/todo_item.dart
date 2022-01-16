import 'package:dandelion_todo/http/rest_api_impl.dart';
import 'package:dandelion_todo/models/index.dart';
import 'package:dandelion_todo/pages/planttree_page.dart';
import 'package:dandelion_todo/pages/todo_edit_page.dart';
import 'package:dandelion_todo/states/config_state.dart';
import 'package:dandelion_todo/states/todo_state.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:provider/provider.dart';

// 首页显示TODO缩略信息的Widget
class TodoItem extends StatelessWidget {
  TodoItem(
      {Key? key,
      required this.todoData,
      this.isUnfinished = true,
      this.isFriend = false})
      : super(key: key);
  Todo todoData;
  bool isUnfinished;
  bool isFriend;

  @override
  Widget build(BuildContext context) {
    // print(todoData.title);
    // print(DateTime.now().minute);
    // print(DateTime.now().second);
    // print(todoData.deadline);
    return Container(
      constraints:
          const BoxConstraints(minWidth: 300, maxWidth: 300, minHeight: 150),
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Provider.of<ConfigState>(context).themeColor.subColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              blurRadius: 2.0,
              color: Provider.of<ConfigState>(context).themeColor.neglected),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Material(
        color: Provider.of<ConfigState>(context).themeColor.subColor,
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
          onLongPress: () => {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  todoData.title,
                  style: TextStyle(
                      color: Provider.of<ConfigState>(context)
                          .themeColor
                          .mainColor,
                      fontSize: Global.TODO_TITLE_SIZE),
                ),
              ),
              Divider(
                color: Provider.of<ConfigState>(context).themeColor.neglected,
                thickness: 1.0,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  todoData.description,
                  style: TextStyle(
                      color: Provider.of<ConfigState>(context)
                          .themeColor
                          .textColor,
                      fontSize: Global.NORMAL_TEXT_SIZE),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: isUnfinished && !isFriend
                    ? <Widget>[
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            constraints: const BoxConstraints(maxWidth: 200),
                            child: Text(
                              'Deadline: ' +
                                  formatDate(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          todoData.deadline.toInt() * 1000),
                                      [yyyy, '-', mm, '-', dd]),
                              style: TextStyle(
                                  // TODO: 时间谜题
                                  color: (todoData.deadline * 1000 -
                                              DateTime.now()
                                                  .millisecondsSinceEpoch <=
                                          259200000)
                                      ? Provider.of<ConfigState>(context)
                                          .themeColor
                                          .warnColor
                                      : Provider.of<ConfigState>(context)
                                          .themeColor
                                          .neglected),
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
                            color: Provider.of<ConfigState>(context)
                                .themeColor
                                .mainColor,
                          ),
                          onPressed: () async {
                            todoData.completeAt =
                                (DateTime.now().millisecondsSinceEpoch / 1000)
                                    .floor();
                            await RestImpl()
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
                            color: Provider.of<ConfigState>(context)
                                .themeColor
                                .warnColor,
                          ),
                          onPressed: () {
                            RestImpl()
                                .deleteUserTodo(Global.getUser(),
                                    todoData.todoId.toInt(), todoData)
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
                            color: Provider.of<ConfigState>(context)
                                .themeColor
                                .textColor,
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
                                      DateTime.fromMillisecondsSinceEpoch(
                                          todoData.completeAt.toInt() * 1000),
                                      [yyyy, '-', mm, '-', dd]),
                              style: TextStyle(
                                  color: Provider.of<ConfigState>(context)
                                      .themeColor
                                      .neglected),
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
