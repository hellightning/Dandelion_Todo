import 'package:dandelion_todo/states/config_state.dart';
import 'package:dandelion_todo/states/profile_state.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:dandelion_todo/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key, this.initItem = 0}) : super(key: key);
  int initItem;
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int currentItem = 0;
  @override
  void initState() {
    currentItem = widget.initItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Provider.of<ConfigState>(context).themeColor.background,
        child: ListView(
          children: [
            DrawerHeader(
              curve: Curves.easeInCubic,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    'assets/imgs/' +
                        Provider.of<ConfigState>(context).themeColor.name +
                        '.jpeg',
                    width: 800,
                    height: 800,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.bottomCenter,
                    // TODO: 用头像代替Icon
                    child: Material(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          MaterialButton(
                            child: ClipOval(
                              child: Provider.of<ProfileState>(context)
                                          .avatar
                                          .length ==
                                      0
                                  ? Image.network(
                                      'https://book.flutterchina.club/logo.png',
                                      height: 70,
                                      width: 70,
                                    )
                                  : Image.memory(
                                      Provider.of<ProfileState>(context).avatar,
                                      height: 70,
                                      width: 70,
                                    ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/account_page');
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              Provider.of<ProfileState>(context).nickname,
                              style: TextStyle(
                                  color: Provider.of<ConfigState>(context)
                                      .themeColor
                                      .warnColor,
                                  fontSize: Global.TODO_TITLE_SIZE),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Material(
              color: Provider.of<ConfigState>(context).themeColor.background,
              child: ListTile(
                tileColor:
                    Provider.of<ConfigState>(context).themeColor.background,
                selectedTileColor:
                    Provider.of<ConfigState>(context).themeColor.subColor,
                selected: currentItem == Global.TODO_DRAWER_UNFINISHED,
                leading: Icon(
                  Icons.update,
                  color: currentItem == Global.TODO_DRAWER_UNFINISHED
                      ? Provider.of<ConfigState>(context).themeColor.mainColor
                      : Provider.of<ConfigState>(context).themeColor.neglected,
                ),
                title: Text(
                  '正在进行',
                  style: TextStyle(
                      fontSize: Global.NORMAL_TEXT_SIZE,
                      color: currentItem == Global.TODO_DRAWER_UNFINISHED
                          ? Provider.of<ConfigState>(context)
                              .themeColor
                              .mainColor
                          : Provider.of<ConfigState>(context)
                              .themeColor
                              .neglected),
                ),
                onTap: () {
                  setState(() {
                    currentItem = Global.TODO_DRAWER_UNFINISHED;
                  });
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/todo_page/unfinished');
                },
              ),
            ),
            Material(
              color: Provider.of<ConfigState>(context).themeColor.background,
              child: ListTile(
                tileColor:
                    Provider.of<ConfigState>(context).themeColor.background,
                selectedTileColor:
                    Provider.of<ConfigState>(context).themeColor.subColor,
                selected: currentItem == Global.TODO_DRAWER_FINISHED,
                leading: Icon(
                  Icons.task_alt,
                  color: currentItem == Global.TODO_DRAWER_FINISHED
                      ? Provider.of<ConfigState>(context).themeColor.mainColor
                      : Provider.of<ConfigState>(context).themeColor.neglected,
                ),
                title: Text(
                  '已完成',
                  style: TextStyle(
                      fontSize: Global.NORMAL_TEXT_SIZE,
                      color: currentItem == Global.TODO_DRAWER_FINISHED
                          ? Provider.of<ConfigState>(context)
                              .themeColor
                              .mainColor
                          : Provider.of<ConfigState>(context)
                              .themeColor
                              .neglected),
                ),
                onTap: () {
                  setState(() {
                    currentItem = Global.TODO_DRAWER_FINISHED;
                  });
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(
                      context, '/todo_page/finished');
                },
              ),
            ),
            Material(
              color: Provider.of<ConfigState>(context).themeColor.background,
              child: ListTile(
                tileColor:
                    Provider.of<ConfigState>(context).themeColor.background,
                selectedTileColor:
                    Provider.of<ConfigState>(context).themeColor.subColor,
                selected: currentItem == Global.TODO_DRAWER_CONFIG,
                leading: Icon(
                  Icons.settings,
                  color: currentItem == Global.TODO_DRAWER_CONFIG
                      ? Provider.of<ConfigState>(context).themeColor.mainColor
                      : Provider.of<ConfigState>(context).themeColor.neglected,
                ),
                title: Text(
                  '设置',
                  style: TextStyle(
                      fontSize: Global.NORMAL_TEXT_SIZE,
                      color: currentItem == Global.TODO_DRAWER_CONFIG
                          ? Provider.of<ConfigState>(context)
                              .themeColor
                              .mainColor
                          : Provider.of<ConfigState>(context)
                              .themeColor
                              .neglected),
                ),
                onTap: () {
                  setState(() {
                    currentItem = Global.TODO_DRAWER_CONFIG;
                  });
                  Navigator.pushNamed(context, '/config_page/setting');
                },
              ),
            ),
            Material(
              color: Provider.of<ConfigState>(context).themeColor.background,
              child: ListTile(
                tileColor:
                    Provider.of<ConfigState>(context).themeColor.background,
                selectedTileColor:
                    Provider.of<ConfigState>(context).themeColor.subColor,
                selected: currentItem == Global.TODO_DRAWER_FRIENDTODO,
                leading: Icon(
                  Icons.visibility,
                  color: currentItem == Global.TODO_DRAWER_FRIENDTODO
                      ? Provider.of<ConfigState>(context).themeColor.mainColor
                      : Provider.of<ConfigState>(context).themeColor.neglected,
                ),
                title: Text(
                  '好友TODO',
                  style: TextStyle(
                      fontSize: Global.NORMAL_TEXT_SIZE,
                      color: currentItem == Global.TODO_DRAWER_FRIENDTODO
                          ? Provider.of<ConfigState>(context)
                              .themeColor
                              .mainColor
                          : Provider.of<ConfigState>(context)
                              .themeColor
                              .neglected),
                ),
                onTap: () {
                  setState(() {
                    currentItem = Global.TODO_DRAWER_FRIENDTODO;
                  });
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/todo_page/friend');
                },
              ),
            ),
            Material(
              color: Provider.of<ConfigState>(context).themeColor.background,
              child: ListTile(
                tileColor:
                    Provider.of<ConfigState>(context).themeColor.background,
                selectedTileColor:
                    Provider.of<ConfigState>(context).themeColor.subColor,
                selected: currentItem == Global.TODO_DRAWER_ADDFRIEND,
                leading: Icon(
                  Icons.people,
                  color: currentItem == Global.TODO_DRAWER_ADDFRIEND
                      ? Provider.of<ConfigState>(context).themeColor.mainColor
                      : Provider.of<ConfigState>(context).themeColor.neglected,
                ),
                title: Text(
                  '好友列表',
                  style: TextStyle(
                      fontSize: Global.NORMAL_TEXT_SIZE,
                      color: currentItem == Global.TODO_DRAWER_ADDFRIEND
                          ? Provider.of<ConfigState>(context)
                              .themeColor
                              .mainColor
                          : Provider.of<ConfigState>(context)
                              .themeColor
                              .neglected),
                ),
                onTap: () {
                  setState(() {
                    currentItem = Global.TODO_DRAWER_ADDFRIEND;
                  });
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/addfriend_page');
                },
              ),
            ),
            Material(
              color: Provider.of<ConfigState>(context).themeColor.background,
              child: ListTile(
                tileColor:
                    Provider.of<ConfigState>(context).themeColor.background,
                selectedTileColor:
                    Provider.of<ConfigState>(context).themeColor.subColor,
                selected: currentItem == Global.TODO_DRAWER_CHANGETHEME,
                leading: Icon(
                  Icons.palette,
                  color: currentItem == Global.TODO_DRAWER_CHANGETHEME
                      ? Provider.of<ConfigState>(context).themeColor.mainColor
                      : Provider.of<ConfigState>(context).themeColor.neglected,
                ),
                title: Text(
                  '修改主题',
                  style: TextStyle(
                      fontSize: Global.NORMAL_TEXT_SIZE,
                      color: currentItem == Global.TODO_DRAWER_CHANGETHEME
                          ? Provider.of<ConfigState>(context)
                              .themeColor
                              .mainColor
                          : Provider.of<ConfigState>(context)
                              .themeColor
                              .neglected),
                ),
                onTap: () async {
                  String selected = 'dark';
                  List<String> themes = List.empty(growable: true);
                  ThemeColor.themeMap.forEach((key, value) {
                    themes.add(key);
                  });
                  await showDialog<String>(
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
                                children: themes
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
                                  selected = themes[value];
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
                                  Navigator.of(context).pop(selected);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).then((value) {
                    Provider.of<ConfigState>(context, listen: false).theme =
                        value ?? 'dark';
                  });
                },
              ),
            ),
            Material(
              color: Provider.of<ConfigState>(context).themeColor.background,
              child: ListTile(
                tileColor:
                    Provider.of<ConfigState>(context).themeColor.background,
                selectedTileColor:
                    Provider.of<ConfigState>(context).themeColor.subColor,
                selected: currentItem == Global.TODO_DRAWER_LOGOUT,
                leading: Icon(
                  Icons.logout,
                  color: currentItem == Global.TODO_DRAWER_LOGOUT
                      ? Provider.of<ConfigState>(context).themeColor.mainColor
                      : Provider.of<ConfigState>(context).themeColor.neglected,
                ),
                title: Text(
                  '登出',
                  style: TextStyle(
                      fontSize: Global.NORMAL_TEXT_SIZE,
                      color: currentItem == Global.TODO_DRAWER_LOGOUT
                          ? Provider.of<ConfigState>(context)
                              .themeColor
                              .mainColor
                          : Provider.of<ConfigState>(context)
                              .themeColor
                              .neglected),
                ),
                onTap: () {
                  Global.logout();
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/login_page');
                },
              ),
            ),
            Material(
              color: Provider.of<ConfigState>(context).themeColor.background,
              child: ListTile(
                tileColor:
                    Provider.of<ConfigState>(context).themeColor.background,
                selectedTileColor:
                    Provider.of<ConfigState>(context).themeColor.subColor,
                selected: currentItem == Global.TODO_DRAWER_HELP,
                leading: Icon(
                  Icons.help,
                  color: currentItem == Global.TODO_DRAWER_HELP
                      ? Provider.of<ConfigState>(context).themeColor.mainColor
                      : Provider.of<ConfigState>(context).themeColor.neglected,
                ),
                title: Text(
                  '帮助',
                  style: TextStyle(
                      fontSize: Global.NORMAL_TEXT_SIZE,
                      color: currentItem == Global.TODO_DRAWER_HELP
                          ? Provider.of<ConfigState>(context)
                              .themeColor
                              .mainColor
                          : Provider.of<ConfigState>(context)
                              .themeColor
                              .neglected),
                ),
                onTap: () {
                  setState(() {
                    currentItem = Global.TODO_DRAWER_HELP;
                  });
                  Navigator.pushNamed(context, '/help_page');
                },
              ),
            ),
            Material(
              color: Provider.of<ConfigState>(context).themeColor.background,
              child: ListTile(
                tileColor:
                    Provider.of<ConfigState>(context).themeColor.background,
                selectedTileColor:
                    Provider.of<ConfigState>(context).themeColor.subColor,
                selected: currentItem == Global.TODO_DRAWER_SUGGEST,
                leading: Icon(
                  Icons.feedback,
                  color: currentItem == Global.TODO_DRAWER_SUGGEST
                      ? Provider.of<ConfigState>(context).themeColor.mainColor
                      : Provider.of<ConfigState>(context).themeColor.neglected,
                ),
                title: Text(
                  '向开发者提建议',
                  style: TextStyle(
                      fontSize: Global.NORMAL_TEXT_SIZE,
                      color: currentItem == Global.TODO_DRAWER_SUGGEST
                          ? Provider.of<ConfigState>(context)
                              .themeColor
                              .mainColor
                          : Provider.of<ConfigState>(context)
                              .themeColor
                              .neglected),
                ),
                onTap: () {
                  Fluttertoast.showToast(msg: 'mail: 1322246041@qq.com');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
