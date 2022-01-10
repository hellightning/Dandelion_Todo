import 'dart:io';

import 'package:dandelion_todo/pages/config_page.dart';
import 'package:dandelion_todo/pages/login_page.dart';
import 'package:dandelion_todo/pages/todo_page.dart';
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

  // @override
  // Widget build(BuildContext context) {
  //   return MultiProvider(
  //     providers: <SingleChildWidget>[
  //       ChangeNotifierProvider.value(value: User()),
  //     ],
  //     child: MaterialApp(
  //       title: 'Dandelion Todo',
  //       theme: ThemeData(
  //         primarySwatch: Colors.blue,
  //       ),
  //       home: LoginPage(),
  //       initialRoute: '/todo_page',
  //       routes: {
  //         '/login_page': (context) => LoginPage(),
  //         '/todo_page': (context) => TodoPage()
  //       },
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dandelion Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoPage(),
      initialRoute: '/todo_page',
      routes: {
        '/todo_page/unfinished': (context) => TodoPage(),
        '/todo_page/finished': (context) => TodoPage(), // 参数应该不一样
        '/config_page/config': (context) => ConfigPage(),
        '/config_page/account': (context) => ConfigPage(),
      },
    );
  }
}
