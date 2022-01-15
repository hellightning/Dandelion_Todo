import 'dart:async';

import 'package:dandelion_todo/models/index.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlanttreePage extends StatefulWidget {
  PlanttreePage({Key? key, required this.todoData}) : super(key: key);
  Todo todoData;
  @override
  _PlanttreePageState createState() => _PlanttreePageState();
}

class _PlanttreePageState extends State<PlanttreePage> {
  bool isPlanting = false;
  FixedExtentScrollController _hourController = FixedExtentScrollController();
  FixedExtentScrollController _minuteController = FixedExtentScrollController();
  int remainSecond = 0;
  int remainMinute = 0;
  int remainHour = 0;
  late Timer _timer;
  @override
  void initState() {
    remainMinute = 60;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.THEME_COLOR.background,
      appBar: AppBar(
        title: Text(
          isPlanting ? '种树中...' : '请选择时间',
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
                  if (remainSecond <= 0) {
                    if (remainMinute <= 0) {
                      if (remainHour <= 0) {
                        // TODO: 更新种树结果到服务端
                        _timer.cancel();
                        isPlanting = false;
                      } else {
                        remainHour -= 1;
                        remainMinute = 59;
                        remainSecond = 59;
                        _hourController.animateToItem(remainHour,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                        _minuteController.animateToItem(remainMinute,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      }
                    } else {
                      remainSecond = 59;
                      remainMinute -= 1;
                      print(remainMinute);
                      _minuteController.animateToItem(remainMinute,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    }
                  } else {
                    remainSecond -= 1;
                  }
                });
            _timer = Timer.periodic(second, callback);
          } else {
            remainHour = 1;
            remainMinute = 59;
            remainSecond = 59;
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
        constraints: BoxConstraints.tightForFinite(),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 200,
              child: CupertinoPicker(
                scrollController: _hourController,
                itemExtent: 30,
                offAxisFraction: -0.5,
                squeeze: 1.5,
                looping: true,
                children: List<int>.filled(10, 0)
                    .fold<List<int>>(List.empty(growable: true), (l, v) {
                      l.add(l.length);
                      return l;
                    })
                    .map((index) => Container(
                          child: Text(
                            '$index时',
                            style:
                                TextStyle(color: Global.THEME_COLOR.textColor),
                          ),
                        ))
                    .toList(),
                onSelectedItemChanged: (value) {
                  if (!isPlanting) {
                    remainHour = value;
                  } else {
                    _hourController.animateToItem(remainHour,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  }
                },
              ),
            ),
            Container(
              width: 100,
              height: 200,
              child: CupertinoPicker(
                scrollController: _minuteController,
                itemExtent: 30,
                offAxisFraction: 0.5,
                squeeze: 3.0,
                looping: true,
                children: List<int>.filled(60, 0)
                    .fold<List<int>>(List.empty(growable: true), (l, v) {
                      l.add(l.length);
                      return l;
                    })
                    .map((index) => Container(
                          child: Text(
                            '$index分',
                            style:
                                TextStyle(color: Global.THEME_COLOR.textColor),
                          ),
                        ))
                    .toList(),
                onSelectedItemChanged: (value) {
                  print(isPlanting);
                  print(remainMinute.toDouble());
                  print(value);
                  if (!isPlanting) {
                    remainMinute = value;
                  } else {
                    _minuteController.animateToItem(remainMinute,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
