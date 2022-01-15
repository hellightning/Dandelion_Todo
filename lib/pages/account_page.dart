import 'package:dandelion_todo/http/rest_api_impl.dart';
import 'package:dandelion_todo/states/config_state.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:dandelion_todo/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ConfigState>(context).themeColor.background,
      appBar: AppBar(
        title: Text(
          '账号设置',
          style: TextStyle(
              color: Provider.of<ConfigState>(context).themeColor.textColor),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              '修改头像',
              style: TextStyle(
                  color:
                      Provider.of<ConfigState>(context).themeColor.textColor),
            ),
            onTap: () {
              ImagePicker()
                  .pickImage(source: ImageSource.gallery)
                  .then((value) {
                Global.uploadAvatar(value!);
              }).catchError((e) {
                Fluttertoast.showToast(msg: e.toString());
              });
            },
          ),
          Divider(
            color: Provider.of<ConfigState>(context).themeColor.neglected,
            thickness: 1,
          ),
          ListTile(
            title: Text('修改昵称',
                style: TextStyle(
                    color: Provider.of<ConfigState>(context)
                        .themeColor
                        .textColor)),
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (context) {
                  var _nicknameController = TextEditingController();
                  return Material(
                    color:
                        Provider.of<ConfigState>(context).themeColor.subColor,
                    child: Container(
                      color:
                          Provider.of<ConfigState>(context).themeColor.subColor,
                      width: 200,
                      height: 250,
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            alignment: Alignment.center,
                            child: TextField(
                              controller: _nicknameController,
                              style: TextStyle(
                                  color: Provider.of<ConfigState>(context)
                                      .themeColor
                                      .textColor),
                              decoration: InputDecoration(
                                labelText: '新昵称',
                                labelStyle: TextStyle(
                                    color: Provider.of<ConfigState>(context)
                                        .themeColor
                                        .textColor),
                                hintText: '请输入炫酷的新昵称',
                                hintStyle: TextStyle(
                                    color: Provider.of<ConfigState>(context)
                                        .themeColor
                                        .neglected),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Provider.of<ConfigState>(context)
                                            .themeColor
                                            .neglected)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Provider.of<ConfigState>(context)
                                            .themeColor
                                            .mainColor)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Provider.of<ConfigState>(context)
                                            .themeColor
                                            .warnColor)),
                              ),
                            ),
                          ),
                          Material(
                            color: Provider.of<ConfigState>(context)
                                .themeColor
                                .background,
                            child: IconButton(
                              icon: Icon(
                                Icons.check_rounded,
                                color: Provider.of<ConfigState>(context)
                                    .themeColor
                                    .mainColor,
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(_nicknameController.text);
                                Global.updateNickname(
                                    _nicknameController.text.trim());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          Divider(
            color: Provider.of<ConfigState>(context).themeColor.neglected,
            thickness: 1,
          ),
          ListTile(
            title: Text('修改密码',
                style: TextStyle(
                    color: Provider.of<ConfigState>(context)
                        .themeColor
                        .textColor)),
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (context) {
                  // TODO: 输入旧密码和重复校验
                  var _passwordController = TextEditingController();
                  return Material(
                    color:
                        Provider.of<ConfigState>(context).themeColor.subColor,
                    child: Container(
                      color:
                          Provider.of<ConfigState>(context).themeColor.subColor,
                      width: 200,
                      height: 250,
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            alignment: Alignment.center,
                            child: TextField(
                              controller: _passwordController,
                              style: TextStyle(
                                  color: Provider.of<ConfigState>(context)
                                      .themeColor
                                      .textColor),
                              decoration: InputDecoration(
                                labelText: '新密码',
                                labelStyle: TextStyle(
                                    color: Provider.of<ConfigState>(context)
                                        .themeColor
                                        .textColor),
                                hintText: '请输入新密码',
                                hintStyle: TextStyle(
                                    color: Provider.of<ConfigState>(context)
                                        .themeColor
                                        .neglected),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Provider.of<ConfigState>(context)
                                            .themeColor
                                            .neglected)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Provider.of<ConfigState>(context)
                                            .themeColor
                                            .mainColor)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Provider.of<ConfigState>(context)
                                            .themeColor
                                            .warnColor)),
                              ),
                            ),
                          ),
                          Material(
                            color: Provider.of<ConfigState>(context)
                                .themeColor
                                .background,
                            child: IconButton(
                              icon: Icon(
                                Icons.check_rounded,
                                color: Provider.of<ConfigState>(context)
                                    .themeColor
                                    .mainColor,
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(_passwordController.text);
                                Global.updatePassword(
                                    _passwordController.text.trim());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          Divider(
            color: Provider.of<ConfigState>(context).themeColor.neglected,
            thickness: 1,
          ),
          ListTile(
            title: Text(
              '登出',
              style: TextStyle(
                  color:
                      Provider.of<ConfigState>(context).themeColor.textColor),
            ),
            onTap: () {
              Global.logout();
              // TODO: 优化写法
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/login_page');
            },
          ),
        ],
      ),
    );
  }
}
