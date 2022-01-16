import 'package:dandelion_todo/models/index.dart';
import 'package:dandelion_todo/states/config_state.dart';
import 'package:dandelion_todo/states/todo_state.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    Global.logout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      backgroundColor: Provider.of<ConfigState>(context).themeColor.background,
      floatingActionButton: FloatingActionButton(
        child: Icon(_isUserEmpty ? Icons.upload : Icons.login),
        onPressed: () async {
          // TODO: 登陆结果校验
          if (_unameController.text == '') {
            Navigator.pushNamed(context, '/register_page').then((value) {
              _unameController.text = value.toString();
            }).catchError((e) {
              Fluttertoast.showToast(msg: e);
            });
          } else if (await Global.login(
              int.parse(
                  _unameController.text == '' ? '0' : _unameController.text),
              _pwdController.text)) {
            Navigator.pushReplacementNamed(context, '/todo_page/unfinished');
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/imgs/' +
                    Provider.of<ConfigState>(context).themeColor.name +
                    '.jpeg',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 200,
              ),
              TextFormField(
                  autofocus: _nameAutoFocus,
                  controller: _unameController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'userid',
                    hintText: '请输入userid',
                    labelStyle: TextStyle(
                        color: Provider.of<ConfigState>(context)
                            .themeColor
                            .textColor),
                    hintStyle: TextStyle(
                        color: Provider.of<ConfigState>(context)
                            .themeColor
                            .neglected),
                    prefixIcon: Icon(Icons.person),
                  ),
                  onTap: () {
                    if (args != null && args is int) {
                      _unameController.text = args.toString();
                    }
                  },
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
                    return v!.trim().isNotEmpty ? null : 'userid不能为空';
                  }),
              TextFormField(
                controller: _pwdController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '请输入不含空字符的密码',
                    labelStyle: TextStyle(
                        color: Provider.of<ConfigState>(context)
                            .themeColor
                            .textColor),
                    hintStyle: TextStyle(
                        color: Provider.of<ConfigState>(context)
                            .themeColor
                            .neglected),
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
                  return v!.trim().isNotEmpty ? null : '密码不能为空';
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
