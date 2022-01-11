import 'package:dandelion_todo/utils/Global.dart';
import 'package:dandelion_todo/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.THEME_COLOR.background,
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              '设置事项',
              style: TextStyle(color: Global.THEME_COLOR.textColor),
            ),
            subtitle: Text('设置说明',
                style: TextStyle(color: Global.THEME_COLOR.neglected)),
          ),
          ListTile(
            title: Text('主题颜色',
                style: TextStyle(color: Global.THEME_COLOR.textColor)),
            subtitle: Text(Global.THEME_COLOR.name),
            // 太丑了，肯定不能这么嗯写
            onTap: () {
              showDialog<Null>(
                context: context,
                builder: (BuildContext context) {
                  return new SimpleDialog(
                    title: new Text('选择'),
                    children: <Widget>[
                      new SimpleDialogOption(
                        child: new Text('blue'),
                        onPressed: () {
                          Global.APP_THEME = AppTheme.blue;
                          Navigator.of(context).pop();
                        },
                      ),
                      new SimpleDialogOption(
                        child: new Text('red'),
                        onPressed: () {
                          Global.APP_THEME = AppTheme.red;
                          Navigator.of(context).pop();
                        },
                      ),
                      new SimpleDialogOption(
                        child: new Text('purple'),
                        onPressed: () {
                          Global.APP_THEME = AppTheme.purple;
                          Navigator.of(context).pop();
                        },
                      ),
                      new SimpleDialogOption(
                        child: new Text('pink'),
                        onPressed: () {
                          Global.APP_THEME = AppTheme.pink;
                          Navigator.of(context).pop();
                        },
                      ),
                      new SimpleDialogOption(
                        child: new Text('green'),
                        onPressed: () {
                          Global.APP_THEME = AppTheme.green;
                          Navigator.of(context).pop();
                        },
                      ),
                      new SimpleDialogOption(
                        child: new Text('dark'),
                        onPressed: () {
                          Global.APP_THEME = AppTheme.dark;
                          Navigator.of(context).pop();
                        },
                      ),
                      new SimpleDialogOption(
                        child: new Text('light'),
                        onPressed: () {
                          Global.APP_THEME = AppTheme.light;
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              ).then((val) {
                print(val);
              });
            },
          ),
        ],
      ),
    );
  }
}
