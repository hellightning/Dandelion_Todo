import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      width: 350,
      height: 60,
      padding: EdgeInsets.all(5.0),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
        color: Colors.blue[100],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/config_page/config');
            },
            child: Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              child: Icon(Icons.menu),
            ),
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
