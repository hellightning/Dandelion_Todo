import 'package:dandelion_todo/states/config_state.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:dandelion_todo/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

/// 由于设置项不多，所以设置界面暂且保留，但不使用
class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);
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
      backgroundColor: Provider.of<ConfigState>(context).themeColor.background,
      appBar: AppBar(
        title: Text('设置（未实现）'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              '语言',
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
            title: Text('主题颜色',
                style: TextStyle(
                    color: Provider.of<ConfigState>(context)
                        .themeColor
                        .textColor)),
            subtitle: Text(Provider.of<ConfigState>(context).themeColor.name,
                style: TextStyle(
                    color: Provider.of<ConfigState>(context)
                        .themeColor
                        .neglected)),
            // 太丑了，肯定不能这么嗯写
            onTap: () {},
          ),
          Divider(
            color: Provider.of<ConfigState>(context).themeColor.neglected,
            thickness: 1,
          ),
          ListTile(
            title: Text(
              'TODO父子关系',
              style: TextStyle(
                  color:
                      Provider.of<ConfigState>(context).themeColor.textColor),
            ),
            subtitle: Text('未启用',
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
            title: Text(
              'TODO多人协作',
              style: TextStyle(
                  color:
                      Provider.of<ConfigState>(context).themeColor.textColor),
            ),
            subtitle: Text('未启用',
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
            title: Text(
              '谁可以看我',
              style: TextStyle(
                  color:
                      Provider.of<ConfigState>(context).themeColor.textColor),
            ),
            subtitle: Text('我的好友',
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
            title: Text(
              '自我监督方式',
              style: TextStyle(
                  color:
                      Provider.of<ConfigState>(context).themeColor.textColor),
            ),
            subtitle: Text('倒计时',
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
            title: Text(
              '音效',
              style: TextStyle(
                  color:
                      Provider.of<ConfigState>(context).themeColor.textColor),
            ),
            subtitle: Text('无',
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
            title: Text(
              '后端开发者',
              style: TextStyle(
                  color:
                      Provider.of<ConfigState>(context).themeColor.textColor),
            ),
            subtitle: Text('肖东序',
                style: TextStyle(
                    color: Provider.of<ConfigState>(context)
                        .themeColor
                        .neglected)),
            onTap: () {
              Fluttertoast.showToast(msg: 'dalao!');
            },
          ),
          Divider(
            color: Provider.of<ConfigState>(context).themeColor.neglected,
            thickness: 1,
          ),
          ListTile(
            title: Text(
              '前端网络通信模块',
              style: TextStyle(
                  color:
                      Provider.of<ConfigState>(context).themeColor.textColor),
            ),
            subtitle: Text('侯瀚茗',
                style: TextStyle(
                    color: Provider.of<ConfigState>(context)
                        .themeColor
                        .neglected)),
            onTap: () {
              Fluttertoast.showToast(msg: 'dalao!');
            },
          ),
          Divider(
            color: Provider.of<ConfigState>(context).themeColor.neglected,
            thickness: 1,
          ),
          ListTile(
            title: Text(
              'Vue Web端',
              style: TextStyle(
                  color:
                      Provider.of<ConfigState>(context).themeColor.textColor),
            ),
            subtitle: Text('周彦翔',
                style: TextStyle(
                    color: Provider.of<ConfigState>(context)
                        .themeColor
                        .neglected)),
            onTap: () {
              Fluttertoast.showToast(msg: 'dalao!');
            },
          ),
          Divider(
            color: Provider.of<ConfigState>(context).themeColor.neglected,
            thickness: 1,
          ),
          ListTile(
            title: Text(
              'Flutter 本程序作者',
              style: TextStyle(
                  color:
                      Provider.of<ConfigState>(context).themeColor.textColor),
            ),
            subtitle: Text('韩炎芃',
                style: TextStyle(
                    color: Provider.of<ConfigState>(context)
                        .themeColor
                        .neglected)),
            onTap: () {
              Fluttertoast.showToast(msg: '菜鸡');
            },
          ),
          Divider(
            color: Provider.of<ConfigState>(context).themeColor.neglected,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
