import 'package:dandelion_todo/http/rest_api_mock.dart';
import 'package:dandelion_todo/models/index.dart';
import 'package:dandelion_todo/states/todo_state.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class TodoEditPage extends StatelessWidget {
  TodoEditPage({Key? key, this.todoData}) : super(key: key);
  final _editKey = GlobalKey<FormState>();
  Todo? todoData;
  var todoJson = Map<String, dynamic>();

  @override
  Widget build(BuildContext context) {
    var _deadlineInputController = TextEditingController();
    var _importanceInputController = TextEditingController();
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
          key: _editKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              // TODO: 复用组件
              TextFormField(
                autofocus: todoData == null,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                initialValue: todoData?.title ?? '',
                style: TextStyle(color: Global.THEME_COLOR.textColor),
                decoration: InputDecoration(
                  labelText: 'TODO标题',
                  labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                  hintText: '概括你的TODO事项',
                  hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.neglected)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.mainColor)),
                  errorBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.warnColor)),
                ),
                onSaved: (newValue) {
                  todoData?.title = newValue ?? '';
                  todoJson['title'] = newValue ?? 'title';
                },
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? '标题不能为空' : null,
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                readOnly: true,
                controller: _deadlineInputController,
                // initialValue: formatDate(
                //     (todoData == null
                //         ? DateTime.now()
                //         : DateTime.fromMillisecondsSinceEpoch(
                //             todoData!.deadline as int)),
                //     [yyyy, '-', mm, '-', dd]),
                style: TextStyle(color: Global.THEME_COLOR.textColor),
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: '结束时间',
                  labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                  hintText: 'Dandelion是宣判终末的Deadline',
                  hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.neglected)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.mainColor)),
                  errorBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.warnColor)),
                ),
                onTap: () async {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                  ).then((value) {
                    try {
                      todoData?.deadline = value!.millisecondsSinceEpoch;
                      todoJson['deadline'] = value!.millisecondsSinceEpoch;
                      _deadlineInputController.text =
                          formatDate(value, [yyyy, '-', mm, '-', dd]);
                    } catch (e) {
                      todoData?.deadline =
                          DateTime.now().millisecondsSinceEpoch;
                      todoJson['deadline'] =
                          DateTime.now().millisecondsSinceEpoch;
                      _deadlineInputController.text =
                          formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
                    }
                  });
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                readOnly: true,
                controller: _importanceInputController,
                style: TextStyle(color: Global.THEME_COLOR.textColor),
                decoration: InputDecoration(
                  labelText: '重要性',
                  labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                  hintText: '数字越大重要性越高',
                  hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.neglected)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.mainColor)),
                  errorBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.warnColor)),
                ),
                onTap: () async {
                  // TODO: picker
                  int importance = 0;
                  await showDialog<int>(
                    context: context,
                    builder: (context) {
                      return Container(
                        color: Global.THEME_COLOR.subColor,
                        width: 200,
                        height: 250,
                        child: Row(
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              alignment: Alignment.center,
                              child: CupertinoPicker(
                                itemExtent: 50,
                                children: List.filled(4, 0)
                                    .fold<List<String>>(
                                        List.empty(growable: true), (l, _) {
                                      l.add(Global.IMPORTANCE_DES[l.length] ??
                                          '摸鱼');
                                      return l;
                                    })
                                    .map((str) => Text(
                                          str,
                                          style: TextStyle(
                                              color:
                                                  Global.THEME_COLOR.textColor),
                                        ))
                                    .toList(),
                                onSelectedItemChanged: (value) {
                                  importance = value;
                                },
                              ),
                            ),
                            Material(
                              color: Global.THEME_COLOR.background,
                              child: IconButton(
                                icon: Icon(
                                  Icons.check_rounded,
                                  color: Global.THEME_COLOR.mainColor,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(importance);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  todoData?.importance = importance;
                  todoJson['importance'] = importance;
                  _importanceInputController.text =
                      Global.IMPORTANCE_DES[importance] ?? '摸鱼';
                },
                // onSaved: (newValue) {
                //   try {
                //     todoData?.importance = int.parse(newValue ?? '0');
                //     todoJson['importance'] = int.parse(newValue ?? '0');
                //   } catch (e) {
                //     todoData?.importance = 0;
                //     todoJson['importance'] = 0;
                //   }
                // },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                style: TextStyle(color: Global.THEME_COLOR.textColor),
                decoration: InputDecoration(
                  labelText: '预计需要时间',
                  labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                  hintText: '你觉得这个任务需要多长时间？',
                  hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.neglected)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.mainColor)),
                  errorBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.warnColor)),
                ),
                // onSaved: (newValue) {
                //   // TODO: 好像没这个逻辑？
                // },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                initialValue: todoData?.description ?? '',
                style: TextStyle(color: Global.THEME_COLOR.textColor),
                maxLines: 10,
                decoration: InputDecoration(
                  labelText: 'TODO详细内容',
                  labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                  hintText: 'TODO还有什么需要描述的',
                  hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.neglected)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: Global.THEME_COLOR.mainColor)),
                  errorBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
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
          _editKey.currentState?.save();
          todoData ??= await RestMock.instance
              .createTodo(Todo.fromJson(todoJson))
              .catchError((e) {
            Fluttertoast.showToast(msg: e.toString());
          });
          todoData?.localId = Uuid().v1();
          await RestMock.instance
              .updateUserTodo(
                  Global.getUser(), todoData!.todoId as int, todoData!)
              .catchError((e) {
            Fluttertoast.showToast(msg: e.toString());
          });
          Provider.of<TodoState>(context).updateTodoList();
          Navigator.pop(context);
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
