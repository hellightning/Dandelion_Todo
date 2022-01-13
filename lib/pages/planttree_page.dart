import 'dart:async';

import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlanttreePage extends StatefulWidget {
  PlanttreePage({Key? key /*,required this.todoid*/}) : super(key: key);
  int todoid = 0;
  @override
  _PlanttreePageState createState() => _PlanttreePageState();
}

class _PlanttreePageState extends State<PlanttreePage> {
  bool isPlanting = false;
  ScrollController _hourController = ScrollController();
  ScrollController _minuteController = ScrollController();
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
                  if (remainSecond <= 0) {
                    // TODO: 更新种树结果到服务端
                    if (remainMinute <= 0) {
                      if (remainHour <= 0) {
                        _timer.cancel();
                        isPlanting = false;
                      } else {
                        remainHour -= 1;
                        remainMinute = 59;
                        remainSecond = 59;
                      }
                    } else {
                      remainSecond = 59;
                      remainMinute -= 1;
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
        child: Row(
          children: [
            Container(
              width: 100,
              height: 200,
              child: ListWheelScrollView.useDelegate(
                controller: _hourController,
                itemExtent: 100,
                offAxisFraction: -0.5,
                perspective: 0.01,
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        alignment: Alignment.center,
                        child: Text('$index时'));
                  },
                  childCount: 5,
                ),
                onSelectedItemChanged: (value) {
                  if (!isPlanting) {
                    remainHour = value;
                  }
                },
              ),
            ),
            Container(
              width: 100,
              height: 200,
              child: ListWheelScrollView.useDelegate(
                controller: _minuteController,
                itemExtent: 100,
                offAxisFraction: 0.5,
                perspective: 0.01,
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        alignment: Alignment.center,
                        child: Text('$index分'));
                  },
                  childCount: 60,
                ),
                onSelectedItemChanged: (value) {
                  if (!isPlanting) {
                    remainMinute = value;
                  }
                },
              ),
            ),
            Container(
              width: 100,
              height: 200,
              child: CupertinoPicker(
                itemExtent: 100,
                children: List<int>.filled(10, 1)
                    .map((index) => Container(
                          child: Text('$index'),
                        ))
                    .toList(),
                onSelectedItemChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
