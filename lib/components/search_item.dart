import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      height: 60,
      padding: EdgeInsets.all(5.0),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
        color: Colors.blue[100],
        boxShadow: <BoxShadow>[
          BoxShadow(
              blurRadius: 3,
              color: Global.THEME_COLOR.neglected,
              offset: Offset(5.0, 5.0))
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/config_page/setting');
            },
            icon: Icon(
              Icons.menu,
              color: Global.THEME_COLOR.neglected,
            ),
            iconSize: 30,
            splashRadius: 30,
          ),
          SizedBox(
              width: 300,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: '搜索TODO事项',
                    border: InputBorder.none),
              )),
        ],
      ),
    );
  }
}
