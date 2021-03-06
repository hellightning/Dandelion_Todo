import 'dart:io';

import 'package:dandelion_todo/components/friend_item.dart';
import 'package:dandelion_todo/components/my_drawer.dart';
import 'package:dandelion_todo/components/addfriend_item.dart';
import 'package:dandelion_todo/components/todo_item.dart';
import 'package:dandelion_todo/states/config_state.dart';
import 'package:dandelion_todo/states/profile_state.dart';
import 'package:dandelion_todo/states/todo_state.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

// TODO: 修加好友
class AddFriendPage extends StatefulWidget {
  AddFriendPage({Key? key, this.currItem = Global.TODO_DRAWER_ADDFRIEND})
      : super(key: key);
  int currItem;
  @override
  _AddFriendPageState createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage> {
  late List<int> _watchList;
  @override
  void initState() {
    _watchList = Provider.of<ProfileState>(context, listen: false).watchList;
    super.initState();
  }

  final _addfriendItem = AddFriendItem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(
        initItem: widget.currItem,
      ),
      backgroundColor: Provider.of<ConfigState>(context).themeColor.background,
      body: Stack(
        children: [
          RefreshIndicator(
            child: ListView(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(20.0),
                )
              ]
                  .followedBy(_watchList.map((userid) => Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: FriendItem(
                          userid: userid,
                        ),
                      )))
                  .toList(),
            ),
            edgeOffset: 25.0,
            onRefresh: () async {
              Provider.of<ProfileState>(context, listen: false).updateUser();
              sleep(const Duration(milliseconds: 500));
            },
            color: Provider.of<ConfigState>(context).themeColor.mainColor,
            backgroundColor:
                Provider.of<ConfigState>(context).themeColor.subColor,
          ),
          _addfriendItem,
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            var content = _addfriendItem.getContent();
            try {
              print('hltn' + content);
              Provider.of<ProfileState>(context, listen: false)
                  .updateWatchlistByUserid(int.parse(content));
              setState(() {
                _watchList = Global.WATCHLIST_DYNAMIC;
              });
            } catch (e) {
              try {
                Provider.of<ProfileState>(context, listen: false)
                    .updateWatchlistByNickname(content);
                setState(() {
                  Global.WATCHLIST_DYNAMIC;
                });
              } catch (e) {
                Fluttertoast.showToast(msg: e.toString());
              }
            }
          },
          child: const Icon(Icons.add)),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
