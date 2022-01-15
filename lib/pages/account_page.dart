import 'package:dandelion_todo/states/config_state.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:dandelion_todo/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
          '账号设置',
          style: TextStyle(
              color: Provider.of<ConfigState>(context).themeColor.textColor),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              '修改头像',
              style: TextStyle(
                  color:
                      Provider.of<ConfigState>(context).themeColor.textColor),
            ),
            subtitle: Text('中文',
                style: TextStyle(
                    color: Provider.of<ConfigState>(context)
                        .themeColor
                        .neglected)),
            onTap: () {
              Fluttertoast.showToast(msg: '尚未实现的功能');
            },
          ),
          Divider(
            color: Provider.of<ConfigState>(context).themeColor.neglected,
            thickness: 1,
          ),
          ListTile(
            title: Text('修改昵称',
                style: TextStyle(
                    color: Provider.of<ConfigState>(context)
                        .themeColor
                        .textColor)),
            subtitle: Text(Provider.of<ConfigState>(context).themeColor.name,
                style: TextStyle(
                    color: Provider.of<ConfigState>(context)
                        .themeColor
                        .neglected)),
            onTap: () {},
          ),
          Divider(
            color: Provider.of<ConfigState>(context).themeColor.neglected,
            thickness: 1,
          ),
          ListTile(
            title: Text(
              '登出',
              style: TextStyle(
                  color:
                      Provider.of<ConfigState>(context).themeColor.textColor),
            ),
            onTap: () {
              Fluttertoast.showToast(msg: '尚未实现的功能');
            },
          ),
        ],
      ),
    );
  }
}
