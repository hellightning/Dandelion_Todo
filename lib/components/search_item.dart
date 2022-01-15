import 'package:dandelion_todo/states/config_state.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key}) : super(key: key);
  // String content = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(
              Icons.menu,
              color: Provider.of<ConfigState>(context).themeColor.mainColor,
            ),
            iconSize: 30,
            splashRadius: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 50,
            child: TextField(
              controller: TextEditingController(
                  text: Provider.of<ConfigState>(context).searchFilter),
              style: TextStyle(
                  color: Provider.of<ConfigState>(context).themeColor.textColor,
                  fontSize: Global.NORMAL_TEXT_SIZE),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  hintText: '搜索TODO事项',
                  hintStyle: TextStyle(
                      color: Provider.of<ConfigState>(context)
                          .themeColor
                          .neglected),
                  border: InputBorder.none),
              // onChanged: (value) {
              //   content = value;
              // },
              onEditingComplete: () {
                // Provider.of<ConfigState>(context).searchFilter = content;
              },
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
        color: Provider.of<ConfigState>(context).themeColor.subColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              blurRadius: 2,
              color: Provider.of<ConfigState>(context).themeColor.neglected,
              offset: const Offset(3.0, 3.0))
        ],
      ),
    );
  }
}
