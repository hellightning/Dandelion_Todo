import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    width: 800,
                    height: 800,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    // TODO: 用头像代替Icon
                    child: Material(
                      color: Colors.transparent,
                      child: IconButton(
                        alignment: Alignment.center,
                        icon: Icon(
                          Icons.account_circle_rounded,
                          size: 60,
                          color: Global.THEME_COLOR.warnColor,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/addfriend_page');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Material(
              color: Global.THEME_COLOR.background,
              child: ListTile(
                tileColor: Global.THEME_COLOR.background,
                selectedTileColor: Global.THEME_COLOR.subColor,
                selected: currentItem == Global.TODO_DRAWER_UNFINISHED,
                leading: Icon(
                  Icons.unpublished_outlined,
                  color: currentItem == Global.TODO_DRAWER_UNFINISHED
                      ? Global.THEME_COLOR.mainColor
                      : Global.THEME_COLOR.neglected,
                ),
                title: Text(
                  '正在进行',
                  style: TextStyle(
                      fontSize: Global.NORMAL_TEXT_SIZE,
                      color: currentItem == Global.TODO_DRAWER_UNFINISHED
                          ? Global.THEME_COLOR.mainColor
                          : Global.THEME_COLOR.neglected),
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
              color: Global.THEME_COLOR.background,
              child: ListTile(
                tileColor: Global.THEME_COLOR.background,
                selectedTileColor: Global.THEME_COLOR.subColor,
                selected: currentItem == Global.TODO_DRAWER_FINISHED,
                leading: Icon(
                  Icons.task_alt,
                  color: currentItem == Global.TODO_DRAWER_FINISHED
                      ? Global.THEME_COLOR.mainColor
                      : Global.THEME_COLOR.neglected,
                ),
                title: Text(
                  '已完成',
                  style: TextStyle(
                      fontSize: Global.NORMAL_TEXT_SIZE,
                      color: currentItem == Global.TODO_DRAWER_FINISHED
                          ? Global.THEME_COLOR.mainColor
                          : Global.THEME_COLOR.neglected),
                ),
                onTap: () {
                  setState(() {
                    currentItem = Global.TODO_DRAWER_FINISHED;
                  });
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/todo_page/finished');
                },
              ),
            ),
            Material(
              color: Global.THEME_COLOR.background,
              child: ListTile(
                tileColor: Global.THEME_COLOR.background,
                selectedTileColor: Global.THEME_COLOR.subColor,
                selected: currentItem == Global.TODO_DRAWER_CONFIG,
                leading: Icon(
                  Icons.settings,
                  color: currentItem == Global.TODO_DRAWER_CONFIG
                      ? Global.THEME_COLOR.mainColor
                      : Global.THEME_COLOR.neglected,
                ),
                title: Text(
                  '设置',
                  style: TextStyle(
                      fontSize: Global.NORMAL_TEXT_SIZE,
                      color: currentItem == Global.TODO_DRAWER_CONFIG
                          ? Global.THEME_COLOR.mainColor
                          : Global.THEME_COLOR.neglected),
                ),
                onTap: () {
                  setState(() {
                    currentItem = Global.TODO_DRAWER_CONFIG;
                  });
                  Navigator.pushNamed(context, '/config_page/setting');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
