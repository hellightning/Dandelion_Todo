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
      child: ListView(
        children: [
          DrawerHeader(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  'assets/imgs/blue.jpeg',
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
            selected: currentItem == Global.TODO_DRAWER_UNFINISHED,
            title: Text('正在进行'),
            onTap: () {
              setState(() {
                currentItem = Global.TODO_DRAWER_UNFINISHED;
              });
            },
          ),
          ListTile(
            selected: currentItem == Global.TODO_DRAWER_FINISHED,
            title: Text('已完成'),
            onTap: () {
              setState(() {
                currentItem = Global.TODO_DRAWER_FINISHED;
              });
            },
          ),
          ListTile(
            selected: currentItem == Global.TODO_DRAWER_CONFIG,
            title: Text('设置'),
            onTap: () {
              setState(() {
                currentItem = Global.TODO_DRAWER_CONFIG;
              });
            },
          ),
          ListTile(
            title: Text('添加好友'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
