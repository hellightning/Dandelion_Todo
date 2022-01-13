import 'dart:async';

import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlanttreePage extends StatefulWidget {
  PlanttreePage({Key? key, required this.totalTime /*,required this.todoid*/})
      : super(key: key);
  int totalTime = 0;
  int todoid = 0;
  @override
  _PlanttreePageState createState() => _PlanttreePageState();
}

class _PlanttreePageState extends State<PlanttreePage> {
  bool isPlanting = false;
  int remainTime = 0;
  late Timer _timer;
  @override
  void initState() {
    remainTime = widget.totalTime;
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
        onPressed: () {
          setState(() {
            isPlanting = !isPlanting;
          });
          if (isPlanting) {
            const second = Duration(seconds: 1);
            var callback = (timer) => setState(() {
                  if (remainTime < 1) {
                    // TODO: 更新种树结果到服务端
                    _timer.cancel();
                  } else {
                    remainTime -= 1;
                  }
                });
            _timer = Timer.periodic(second, callback);
          } else {
            remainTime = widget.totalTime;
            try {
              _timer.cancel();
            } catch (e) {
              print(e);
            }
          }
        },
        child: Icon(
          Icons.add_alarm_rounded,
          color: Global.THEME_COLOR.textColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        child: Text(
          remainTime.toString(),
          style: TextStyle(
              color: isPlanting
                  ? Global.THEME_COLOR.mainColor
                  : Global.THEME_COLOR.neglected),
        ),
      ),
    );
  }
}
