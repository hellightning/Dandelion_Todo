import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlanttreePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _PlanttreePageState extends State<PlanttreePage> {
  int remainTime = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '种树中...',
          style: TextStyle(
              fontSize: Global.APPBAR_TITLE_SIZE,
              color: Global.THEME_COLOR.textColor),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.ac_unit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(),
    );
  }
}
