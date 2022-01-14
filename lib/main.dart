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
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'utils/Global.dart';

void main() {
  Global.init().then((e) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Provider管理全局状态
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
      child: MaterialApp(
        title: 'Dandelion Todo',
        color: Global.THEME_COLOR.background,
        theme: ThemeData(
          primarySwatch: Global.THEME_COLOR.themeColor,
        ),
        initialRoute:
            Global.isLoggedIn() ? '/todo_page/unfinished' : '/login_page',
        // initialRoute: '/planttree_page',
        routes: {
          '/todo_page/unfinished': (context) => TodoPage(
                isUnfinished: true,
              ),
          '/todo_page/finished': (context) => TodoPage(
                isUnfinished: false,
              ), // 参数应该不一样
          '/config_page/setting': (context) => ConfigPage(),
          '/config_page/account': (context) => ConfigPage(), // 同上
          '/edit_page/add': (context) => TodoEditPage(),
          '/edit_page/edit': (context) => TodoEditPage(),
          '/login_page': (context) => LoginPage(),
          '/planttree_page': (context) => PlanttreePage(),
          '/addfriend_page': (context) => AddFriendPage(),
        },
      ),
    );
  }
}
