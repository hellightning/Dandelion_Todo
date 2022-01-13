import 'package:dandelion_todo/http/http_error.dart';
import 'package:dandelion_todo/http/rest_api_mock.dart';
import 'package:dandelion_todo/models/index.dart';
import 'package:dandelion_todo/pages/todo_page.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:dandelion_todo/utils/launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  bool pwdShow = false; //密码是否显示明文
  GlobalKey _formKey = GlobalKey<FormState>();
  bool _nameAutoFocus = true;
  bool _isUserEmpty = true;
  // TODO: 使用provider管理全局用户状态进行替换
  User? userData;

  @override
  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    if (_unameController.text != null) {
      _nameAutoFocus = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      backgroundColor: Global.THEME_COLOR.background,
      floatingActionButton: FloatingActionButton(
        child: Icon(_isUserEmpty ? Icons.upload : Icons.login),
        onPressed: () async {
          // TODO: 登陆结果校验
          if (_unameController.text == '' && _pwdController.text == '') {
            Navigator.pushNamed(context, 'register_page');
          } else if (await DandelionLauncher.login(
                  int.parse(_unameController.text), _pwdController.text)
              // TODO: 使用用户名登陆？
              ) {
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) {
            //   // TODO: 传递用户登录数据
            //   return TodoPage(
            //     isUnfinished: true,
            //   );
            // }));
            Navigator.pushReplacementNamed(context, '/todo_page/unfinished');
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/imgs/' + Global.THEME_COLOR.name + '.jpeg',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 200,
              ),
              TextFormField(
                  autofocus: _nameAutoFocus,
                  controller: _unameController,
                  decoration: InputDecoration(
                    labelText: '请输入userid或昵称',
                    hintText: 'input userid or nickname',
                    labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                    hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                    prefixIcon: Icon(Icons.person),
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      setState(() {
                        _isUserEmpty = true;
                      });
                    } else {
                      setState(() {
                        _isUserEmpty = false;
                      });
                    }
                  },
                  validator: (v) {
                    return v!.trim().isNotEmpty
                        ? null
                        : 'please input your username';
                  }),
              TextFormField(
                controller: _pwdController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                    labelText: 'password',
                    hintText: 'please input your password',
                    labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                    hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                          pwdShow ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          pwdShow = !pwdShow;
                        });
                      },
                    )),
                obscureText: !pwdShow,
                validator: (v) {
                  return v!.trim().isNotEmpty ? null : '请输入密码';
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
