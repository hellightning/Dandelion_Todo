import 'package:flutter/material.dart';

class Router {
  static const homePage = 'app://';
  static const loginPage = 'app://login_page';
  static const registerPage = 'app://register_page';
  static const planttreePage = 'app://planttree_page';
  static const todoPage = 'app://todo_page';
  static const totoEditPage = 'app://todo_page/todo_edit_page';

  Widget? _getPage(String url, dynamic params) {
    switch (url) {
      case homePage:
        return null;
      case loginPage:
        return null;
    }
    return null;
  }

  Router.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, null)!;
    }));
  }

  Router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params)!;
    }));
  }
}
