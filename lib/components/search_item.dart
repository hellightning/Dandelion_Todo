import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(
              Icons.menu,
              color: Global.THEME_COLOR.mainColor,
            ),
            iconSize: 30,
            splashRadius: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 50,
            child: TextField(
              controller: TextEditingController(text: ''),
              style: TextStyle(
                  color: Global.THEME_COLOR.textColor,
                  fontSize: Global.NORMAL_TEXT_SIZE),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  hintText: '搜索TODO事项',
                  hintStyle: TextStyle(color: Global.THEME_COLOR.neglected),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      height: 60,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(2.0)),
        color: Global.THEME_COLOR.subColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              blurRadius: 2,
              color: Global.THEME_COLOR.neglected,
              offset: const Offset(3.0, 3.0))
        ],
      ),
    );
  }
}
