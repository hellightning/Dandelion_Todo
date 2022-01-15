import 'dart:io';

import 'package:dandelion_todo/pages/addfriend_page.dart';
import 'package:dandelion_todo/pages/config_page.dart';
import 'package:dandelion_todo/pages/login_page.dart';
import 'package:dandelion_todo/pages/planttree_page.dart';
import 'package:dandelion_todo/pages/todo_edit_page.dart';
import 'package:dandelion_todo/pages/todo_page.dart';
import 'package:dandelion_todo/states/profile_state.dart';
import 'package:dandelion_todo/states/config_state.dart';
import 'package:dandelion_todo/states/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'utils/Global.dart';

void main() {
  Global.init().then((e) async {
    return Global.isLoggedIn();
  }).catchError((e) {
    Fluttertoast.showToast(msg: e.toString());
  }).then((loggedIn) => runApp(MyApp(isLoggedIn: loggedIn)));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.isLoggedIn}) : super(key: key);
  bool isLoggedIn;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProfileState(),
        ),
        ChangeNotifierProvider.value(
          value: ConfigState(),
        ),
        ChangeNotifierProvider.value(
          value: TodoState(),
        )
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Dandelion Todo',
          color: Provider.of<ConfigState>(context).themeColor.background,
          theme: ThemeData(
            primarySwatch:
                Provider.of<ConfigState>(context).themeColor.themeColor,
          ),
          initialRoute: isLoggedIn ? '/todo_page/unfinished' : '/login_page',
          // initialRoute: '/planttree_page',
          routes: {
            '/todo_page/unfinished': (context) => TodoPage(
                  isUnfinished: true,
                  currItem: Global.TODO_DRAWER_UNFINISHED,
                ),
            '/todo_page/finished': (context) => TodoPage(
                  isUnfinished: false,
                  currItem: Global.TODO_DRAWER_FINISHED,
                ),
            '/todo_page/friend': (context) => TodoPage(
                  isUnfinished: true,
                  isFriend: true,
                  currItem: Global.TODO_DRAWER_FRIENDTODO,
                ), // 参数应该不一样
            '/config_page/setting': (context) => ConfigPage(),
            '/config_page/account': (context) => ConfigPage(), // 同上
            '/edit_page/add': (context) => TodoEditPage(),
            // '/edit_page/edit': (context) => TodoEditPage(),
            '/login_page': (context) => LoginPage(),
            // '/planttree_page': (context) => PlanttreePage(),
            '/addfriend_page': (context) => AddFriendPage(),
          },
        );
      },
    );
  }
}
