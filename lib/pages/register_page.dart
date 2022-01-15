import 'package:dandelion_todo/states/config_state.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

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
      backgroundColor: Provider.of<ConfigState>(context).themeColor.background,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.upload),
        onPressed: () async {
          if (_unameController.text == '' ||
              _pwdController.text == '' ||
              _pwdController.text != _pwdcController.text) {
            //TODO: 校验失败的逻辑
          } else {
            int userid = await Global.register(
                _unameController.text, _pwdController.text);
            print(userid);
            Fluttertoast.showToast(msg: '你的userId是:$userid');
            //TODO: 显示注册结果
            Navigator.pop(context, userid);
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
                  decoration: InputDecoration(
                    labelText: '昵称',
                    hintText: 'input your nickname',
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
                  return v!.trim().isNotEmpty ? null : '请输入密码';
                },
              ),
              TextFormField(
                controller: _pwdcController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                    labelText: '确认密码',
                    hintText: 'please input your password again',
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
