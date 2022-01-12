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
                    labelText: 'input user name',
                    hintText: 'input user name or email',
                    labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                    hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                    prefixIcon: Icon(Icons.person),
                  ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    child: Icon(Icons.login),
                    onPressed: () {
                      if (DandelionLauncher.isLoginSuccess(
                          _unameController.text, _pwdController.text)) {
                        Navigator.pushReplacementNamed(context,
                            '/todo_page/unfinished'); //+_unameController.text + '/unfinished');
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
