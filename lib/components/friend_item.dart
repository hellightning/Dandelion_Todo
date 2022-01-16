import 'dart:typed_data';

import 'package:dandelion_todo/http/rest_api_impl.dart';
import 'package:dandelion_todo/states/config_state.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriendItem extends StatefulWidget {
  FriendItem({Key? key, required this.userid}) : super(key: key);
  int userid = 0;

  @override
  _FriendItemState createState() => _FriendItemState();
}

class _FriendItemState extends State<FriendItem> {
  String nickname = '';
  Uint8List avatarByte = Uint8List(0);
  @override
  void initState() {
    RestImpl().findNicknameById(widget.userid).then((value) {
      nickname = value ?? 'unknown nickname';
    });
    RestImpl().getAvatar(widget.userid).then((value) {
      avatarByte = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          const BoxConstraints(minWidth: 300, maxWidth: 300, minHeight: 80),
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Provider.of<ConfigState>(context).themeColor.subColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              blurRadius: 2.0,
              color: Provider.of<ConfigState>(context).themeColor.neglected),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Material(
        color: Provider.of<ConfigState>(context).themeColor.subColor,
        type: MaterialType.button,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: InkWell(
          onTap: () {},
          onLongPress: () => {},
          child: Row(
            children: [
              ClipOval(
                child: avatarByte.length == 0
                    ? Image.asset(
                        'assets/imgs/dandelion_avatar.png',
                        height: 70,
                        width: 70,
                      )
                    : Image.memory(
                        avatarByte,
                        height: 70,
                        width: 70,
                      ),
              ),
              Column(
                children: [Text(nickname), Text('userid: ${widget.userid}')],
              ),
              IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
