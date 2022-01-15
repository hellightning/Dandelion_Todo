import 'package:dandelion_todo/states/config_state.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:dandelion_todo/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

/// 由于设置项不多，所以设置界面暂且保留，但不使用
class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ConfigState>(context).themeColor.background,
      appBar: AppBar(
        title: Text(
          '帮助',
          style: TextStyle(
              color: Provider.of<ConfigState>(context).themeColor.textColor),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              '添加好友',
              style: TextStyle(
                  color:
                      Provider.of<ConfigState>(context).themeColor.textColor),
            ),
            onTap: () {
              Fluttertoast.showToast(msg: '输入要添加好友的nickname或userId');
            },
          ),
          Divider(
            color: Provider.of<ConfigState>(context).themeColor.neglected,
            thickness: 1,
          ),
          ListTile(
            title: Text('修改昵称或头像',
                style: TextStyle(
                    color: Provider.of<ConfigState>(context)
                        .themeColor
                        .textColor)),
            onTap: () {
              Fluttertoast.showToast(msg: '点击抽屉界面的头像进入管理页面');
            },
          ),
          Divider(
            color: Provider.of<ConfigState>(context).themeColor.neglected,
            thickness: 1,
          ),
          ListTile(
            title: Text(
              '编辑TODO事项',
              style: TextStyle(
                  color:
                      Provider.of<ConfigState>(context).themeColor.textColor),
            ),
            onTap: () {
              Fluttertoast.showToast(msg: '单击TODO事项');
            },
          ),
        ],
      ),
    );
  }
}
