import 'package:dandelion_todo/utils/Global.dart';
import 'package:dandelion_todo/utils/launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _pwdcController = TextEditingController();
  bool pwdShow = false;
  final GlobalKey _formKey = GlobalKey<FormState>();
  bool _nameAutoFocus = true;

  @override
  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    if (_unameController.text != '') {
      _nameAutoFocus = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('注册')),
      backgroundColor: Global.THEME_COLOR.background,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.upload),
        onPressed: () async {
          // TODO:
          if (_unameController.text == '' ||
              _pwdController.text == '' ||
              _pwdController.text != _pwdcController.text) {
            ;
          } else {
            await DandelionLauncher.register(
                _unameController.text, _pwdController.text);

            Navigator.pop(context);
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
                    labelText: '昵称',
                    hintText: 'input your nickname',
                    labelStyle: TextStyle(color: Global.THEME_COLOR.textColor),
                    hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (v) {
                    return v!.trim().isNotEmpty
                        ? null
                        : 'please input your nickname';
                  }),
              TextFormField(
                controller: _pwdController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                    labelText: '密码',
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
              TextFormField(
                controller: _pwdcController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                    labelText: '确认密码',
                    hintText: 'please input your password again',
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
