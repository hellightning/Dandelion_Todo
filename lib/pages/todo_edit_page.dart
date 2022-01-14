import 'package:dandelion_todo/http/rest_api_mock.dart';
import 'package:dandelion_todo/models/index.dart';
import 'package:dandelion_todo/states/todo_state.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoEditPage extends StatelessWidget {
  TodoEditPage({Key? key, this.todoData}) : super(key: key);
  Todo? todoData;
  var todoJson = Map<String, dynamic>();

  @override
  Widget build(BuildContext context) {
    var editKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (todoData == null) ? '新添TODO项目' : '编辑TODO项目',
          style: TextStyle(color: Global.THEME_COLOR.textColor),
        ),
      ),
      backgroundColor: Global.THEME_COLOR.background,
      body: Container(
        child: Form(
          key: editKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: todoData?.title ?? '',
                style: TextStyle(color: Global.THEME_COLOR.textColor),
                decoration: InputDecoration(
                  labelText: 'TODO标题',
                  labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                  hintText: '概括你的TODO事项',
                  hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.neglected)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.mainColor)),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.warnColor)),
                ),
                onSaved: (newValue) {
                  todoData?.title = newValue ?? '';
                  todoJson['title'] = newValue ?? 'title';
                },
              ),
              TextFormField(
                style: TextStyle(color: Global.THEME_COLOR.textColor),
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: '结束时间',
                  labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                  hintText: 'Dandelion是宣判终末的Deadline',
                  hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.neglected)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.mainColor)),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.warnColor)),
                ),
                onSaved: (newValue) {
                  var parted =
                      newValue?.split('-').map((value) => int.parse(value));
                  var date = DateTime((parted as List)[0] ?? 2022,
                          (parted as List)[1] ?? 1, (parted as List)[2] ?? 1)
                      .millisecondsSinceEpoch;
                  todoData?.deadline = date;
                  todoJson['deadline'] = date;
                },
              ),
              TextFormField(
                style: TextStyle(color: Global.THEME_COLOR.textColor),
                decoration: InputDecoration(
                  labelText: '重要性',
                  labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                  hintText: '数字越大重要性越高',
                  hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.neglected)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.mainColor)),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.warnColor)),
                ),
                onSaved: (newValue) {
                  try {
                    todoData?.importance = int.parse(newValue ?? '0');
                    todoJson['importance'] = int.parse(newValue ?? '0');
                  } catch (e) {
                    todoData?.importance = 0;
                    todoJson['importance'] = 0;
                  }
                },
              ),
              TextFormField(
                style: TextStyle(color: Global.THEME_COLOR.textColor),
                decoration: InputDecoration(
                  labelText: '预计需要时间',
                  labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                  hintText: '你觉得这个任务需要多长时间？',
                  hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.neglected)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.mainColor)),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.warnColor)),
                ),
                onSaved: (newValue) {
                  // TODO: 好像没这个逻辑？
                },
              ),
              TextFormField(
                style: TextStyle(color: Global.THEME_COLOR.textColor),
                decoration: InputDecoration(
                  labelText: 'TODO详细内容',
                  labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                  hintText: 'TODO还有什么需要描述的',
                  hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.neglected)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.mainColor)),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.warnColor)),
                ),
                onSaved: (newValue) {
                  todoData?.description = newValue ?? 'description';
                  todoJson['description'] = newValue ?? 'description';
                },
              ),
            ],
          ),
        ),
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        padding: EdgeInsets.all(5.0),
        decoration: new BoxDecoration(
          border: Border(
              bottom: BorderSide(
                color: Global.THEME_COLOR.neglected,
                width: 3.0,
              ),
              right:
                  BorderSide(color: Global.THEME_COLOR.neglected, width: 3.0)),
          // borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Global.THEME_COLOR.subColor,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          editKey.currentState?.save();
          todoData ??=
              await RestMock.instance.createTodo(Todo.fromJson(todoJson));
          await RestMock.instance.updateUserTodo(
              Global.getUser(), todoData!.todoId as int, todoData!);
          Provider.of<TodoState>(context).updateTodoList();
          Navigator.pop(context);
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
