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
            child: Icon(Icons.account_box_sharp),
          ),
          ListTile(
            title: Text('已完成'),
            onTap: () {},
          ),
          ListTile(
            title: Text('正在进行'),
            onTap: () {},
          ),
          ListTile(
            title: Text('设置'),
            onTap: () {},
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
