import 'package:dandelion_todo/http/rest_api_impl.dart';
import 'package:dandelion_todo/models/index.dart';
import 'package:dandelion_todo/states/config_state.dart';
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
    // TODO: 日期选择第一次无效
    var _deadlineInputController = TextEditingController(
        text: formatDate(
            (todoData == null
                ? DateTime.now()
                : DateTime.fromMillisecondsSinceEpoch(
                    todoData!.deadline.toInt() * 1000)),
            [yyyy, '-', mm, '-', dd]));
    var _importanceInputController = TextEditingController(
        text: todoData == null
            ? Global.IMPORTANCE_DES[0]
            : Global.IMPORTANCE_DES[todoData!.importance]);
    var _timeconsumingInputController = TextEditingController(text: '0');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (todoData == null) ? '新添TODO项目' : '编辑TODO项目',
          style: TextStyle(
              color: Provider.of<ConfigState>(context).themeColor.textColor),
        ),
      ),
      backgroundColor: Provider.of<ConfigState>(context).themeColor.background,
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
                style: TextStyle(
                    color:
                        Provider.of<ConfigState>(context).themeColor.textColor),
                decoration: InputDecoration(
                  labelText: 'TODO标题',
                  labelStyle: TextStyle(
                      color: Provider.of<ConfigState>(context)
                          .themeColor
                          .textColor),
                  hintText: '概括你的TODO事项',
                  hintStyle: TextStyle(
                      color: Provider.of<ConfigState>(context)
                          .themeColor
                          .neglected),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                          color: Provider.of<ConfigState>(context)
                              .themeColor
                              .neglected)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                          color: Provider.of<ConfigState>(context)
                              .themeColor
                              .mainColor)),
                  errorBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                          color: Provider.of<ConfigState>(context)
                              .themeColor
                              .warnColor)),
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
                style: TextStyle(
                    color:
                        Provider.of<ConfigState>(context).themeColor.textColor),
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: '结束时间',
                  labelStyle: TextStyle(
                      color: Provider.of<ConfigState>(context)
                          .themeColor
                          .textColor),
                  hintText: 'Dandelion是宣判终末的Deadline',
                  hintStyle: TextStyle(
                      color: Provider.of<ConfigState>(context)
                          .themeColor
                          .neglected),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                          color: Provider.of<ConfigState>(context)
                              .themeColor
                              .neglected)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                          color: Provider.of<ConfigState>(context)
                              .themeColor
                              .mainColor)),
                  errorBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                          color: Provider.of<ConfigState>(context)
                              .themeColor
                              .warnColor)),
                ),
                onTap: () async {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                  ).then((value) {
                    try {
                      todoData?.deadline =
                          (value!.millisecondsSinceEpoch / 1000).floor();
                      todoJson['deadline'] =
                          (value!.millisecondsSinceEpoch / 1000).floor();
                      _deadlineInputController.text =
                          formatDate(value, [yyyy, '-', mm, '-', dd]);
                    } catch (e) {
                      Fluttertoast.showToast(msg: e.toString());
                      todoData?.deadline =
                          (DateTime.now().millisecondsSinceEpoch / 1000)
                              .floor();
                      todoJson['deadline'] =
                          (DateTime.now().millisecondsSinceEpoch / 1000)
                              .floor();
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
                style: TextStyle(
                    color:
                        Provider.of<ConfigState>(context).themeColor.textColor),
                decoration: InputDecoration(
                  labelText: '重要性',
                  labelStyle: TextStyle(
                      color: Provider.of<ConfigState>(context)
                          .themeColor
                          .textColor),
                  hintText: '数字越大重要性越高',
                  hintStyle: TextStyle(
                      color: Provider.of<ConfigState>(context)
                          .themeColor
                          .neglected),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                          color: Provider.of<ConfigState>(context)
                              .themeColor
                              .neglected)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                          color: Provider.of<ConfigState>(context)
                              .themeColor
                              .mainColor)),
                  errorBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                          color: Provider.of<ConfigState>(context)
                              .themeColor
                              .warnColor)),
                ),
                onTap: () async {
                  int importance = 0;
                  await showDialog<int>(
                    context: context,
                    builder: (context) {
                      return Container(
                        color: Provider.of<ConfigState>(context)
                            .themeColor
                            .subColor,
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
                                              color: Provider.of<ConfigState>(
                                                      context)
                                                  .themeColor
                                                  .textColor),
                                        ))
                                    .toList(),
                                onSelectedItemChanged: (value) {
                                  importance = value;
                                },
                              ),
                            ),
                            Material(
                              color: Provider.of<ConfigState>(context)
                                  .themeColor
                                  .background,
                              child: IconButton(
                                icon: Icon(
                                  Icons.check_rounded,
                                  color: Provider.of<ConfigState>(context)
                                      .themeColor
                                      .mainColor,
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
                controller: _timeconsumingInputController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    color:
                        Provider.of<ConfigState>(context).themeColor.textColor),
                decoration: InputDecoration(
                  labelText: '预计需要时间',
                  labelStyle: TextStyle(
                      color: Provider.of<ConfigState>(context)
                          .themeColor
                          .textColor),
                  hintText: 'TODO任务预期时间，单位为h',
                  hintStyle: TextStyle(
                      color: Provider.of<ConfigState>(context)
                          .themeColor
                          .neglected),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                          color: Provider.of<ConfigState>(context)
                              .themeColor
                              .neglected)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                          color: Provider.of<ConfigState>(context)
                              .themeColor
                              .mainColor)),
                  errorBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                          color: Provider.of<ConfigState>(context)
                              .themeColor
                              .warnColor)),
                ),
                onSaved: (newValue) {
                  // TODO: 好像没这个逻辑？
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                initialValue: todoData?.description ?? '',
                style: TextStyle(
                    color:
                        Provider.of<ConfigState>(context).themeColor.textColor),
                maxLines: 10,
                decoration: InputDecoration(
                  labelText: 'TODO详细内容',
                  labelStyle: TextStyle(
                      color: Provider.of<ConfigState>(context)
                          .themeColor
                          .textColor),
                  hintText: 'TODO还有什么需要描述的',
                  hintStyle: TextStyle(
                      color: Provider.of<ConfigState>(context)
                          .themeColor
                          .neglected),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                          color: Provider.of<ConfigState>(context)
                              .themeColor
                              .neglected)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                          color: Provider.of<ConfigState>(context)
                              .themeColor
                              .mainColor)),
                  errorBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                          color: Provider.of<ConfigState>(context)
                              .themeColor
                              .warnColor)),
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
                color: Provider.of<ConfigState>(context).themeColor.neglected,
                width: 3.0,
              ),
              right: BorderSide(
                  color: Provider.of<ConfigState>(context).themeColor.neglected,
                  width: 3.0)),
          // borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Provider.of<ConfigState>(context).themeColor.subColor,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            _editKey.currentState?.save();
            if (!todoJson.containsKey('importance')) {
              todoJson['importance'] = 0;
            }
            if (!todoJson.containsKey('deadline')) {
              todoJson['deadline'] = (DateTime.now()
                          .add(const Duration(days: 1))
                          .millisecondsSinceEpoch /
                      1000)
                  .floor();
            }
            todoJson['createAt'] =
                (DateTime.now().millisecondsSinceEpoch / 1000).floor();
            todoJson['completeAt'] = 0;
            todoJson['creatorId'] = Global.getUser();
            // TODO: 种树时间
            todoJson['localId'] = Uuid().v1();
            todoJson['parentId'] = 0;
            todoJson['plantTime'] = 0;
            todoJson['todoId'] = 0;
            todoJson['updateAt'] =
                (DateTime.now().millisecondsSinceEpoch / 1000).floor();
            print('sending' + todoJson.toString());
            todoData ??= await RestImpl()
                .createTodo(Todo.fromJson(todoJson))
                .catchError((e) {
              Fluttertoast.showToast(msg: e.toString());
            });
            todoData?.localId = Uuid().v1();
            await RestImpl()
                .updateUserTodo(
                    Global.getUser(), todoData!.todoId.toInt(), todoData!)
                .catchError((e) {
              Fluttertoast.showToast(msg: e.toString());
            });
            try {
              Provider.of<TodoState>(context, listen: false)
                  .updateTodo(todoData!);
            } catch (e) {
              Fluttertoast.showToast(msg: e.toString());
            }
            Navigator.pop(context);
          } catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
