import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int currentItem = 0;
  @override
  void initState() {
    currentItem = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Global.THEME_COLOR.background,
        child: ListView(
          children: [
            DrawerHeader(
              curve: Curves.easeInCubic,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    'assets/imgs/' + Global.THEME_COLOR.name + '.jpeg',
                    fit: BoxFit.cover,
                  ),
                  IconButton(
                    icon: Icon(Icons.account_circle_rounded),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            ListTile(
              selectedTileColor: Global.THEME_COLOR.subColor,
              selected: currentItem == Global.TODO_DRAWER_UNFINISHED,
              title: Text(
                '正在进行',
                style: TextStyle(
                    fontSize: 16,
                    color: currentItem == Global.TODO_DRAWER_UNFINISHED
                        ? Global.THEME_COLOR.mainColor
                        : Global.THEME_COLOR.textColor),
              ),
              onTap: () {
                setState(() {
                  currentItem = Global.TODO_DRAWER_UNFINISHED;
                });
              },
            ),
            ListTile(
              selectedTileColor: Global.THEME_COLOR.subColor,
              selected: currentItem == Global.TODO_DRAWER_FINISHED,
              title: Text(
                '已完成',
                style: TextStyle(
                    fontSize: 16,
                    color: currentItem == Global.TODO_DRAWER_FINISHED
                        ? Global.THEME_COLOR.mainColor
                        : Global.THEME_COLOR.textColor),
              ),
              onTap: () {
                setState(() {
                  currentItem = Global.TODO_DRAWER_FINISHED;
                });
              },
            ),
            ListTile(
              selectedTileColor: Global.THEME_COLOR.subColor,
              selected: currentItem == Global.TODO_DRAWER_CONFIG,
              title: Text(
                '设置',
                style: TextStyle(
                    fontSize: 16,
                    color: currentItem == Global.TODO_DRAWER_CONFIG
                        ? Global.THEME_COLOR.mainColor
                        : Global.THEME_COLOR.textColor),
              ),
              onTap: () {
                setState(() {
                  currentItem = Global.TODO_DRAWER_CONFIG;
                });
                Navigator.pushNamed(context, '/config_page/setting');
              },
            ),
            ListTile(
              selectedTileColor: Global.THEME_COLOR.subColor,
              title: Text(
                '添加好友',
                style: TextStyle(
                    fontSize: 16,
                    color: currentItem == Global.TODO_DRAWER_ACCOUNT
                        ? Global.THEME_COLOR.mainColor
                        : Global.THEME_COLOR.textColor),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
