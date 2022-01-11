import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoEditPage extends StatelessWidget {
  const TodoEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '新添TODO项目',
          style: TextStyle(color: Global.THEME_COLOR.textColor),
        ),
      ),
      backgroundColor: Global.THEME_COLOR.background,
      body: Container(
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                style: TextStyle(color: Global.THEME_COLOR.textColor),
                decoration: InputDecoration(
                  labelText: 'TODO标题',
                  labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                  hintText: '概括你的TODO事项',
                  hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                ),
              ),
              TextFormField(
                style: TextStyle(color: Global.THEME_COLOR.textColor),
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: '开始时间',
                  labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                  hintText: '任务从什么时候开始？',
                  hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                ),
              ),
              TextFormField(
                style: TextStyle(color: Global.THEME_COLOR.textColor),
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: '结束时间',
                  labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                  hintText: 'Dandelion是宣判终末的Deadline',
                  hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                ),
              ),
              TextFormField(
                style: TextStyle(color: Global.THEME_COLOR.textColor),
                decoration: InputDecoration(
                  labelText: '重要性',
                  labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                  hintText: '数字越大重要性越高',
                  hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                ),
              ),
              TextFormField(
                style: TextStyle(color: Global.THEME_COLOR.textColor),
                decoration: InputDecoration(
                  labelText: 'TODO详细内容',
                  labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                  hintText: 'TODO还有什么需要描述的',
                  hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                ),
              ),
              TextFormField(
                style: TextStyle(color: Global.THEME_COLOR.textColor),
                decoration: InputDecoration(
                  labelText: '预计需要时间',
                  labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                  hintText: '你觉得这个任务需要多长时间？',
                  hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                ),
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
        onPressed: () => Navigator.pop(context),
        child: Icon(Icons.send),
      ),
    );
  }
}
