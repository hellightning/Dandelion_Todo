import 'package:dandelion_todo/models/index.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 首页显示TODO缩略信息的Widget
class TodoItem extends StatelessWidget {
  TodoItem({Key? key, required this.todoData}) : super(key: key);
  Todo todoData;
  // String todoTitle = "Test Title";
  // String todoContent = "test content test content test content test content";
  // int importance = 0;
  // DateTime fromTime = DateTime.now();
  // DateTime toTime = DateTime(2099);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/edit_page/edit');
      },
      onLongPress: () => {
        // TODO 长按拖拽可以调整顺序
      },
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                todoData.title,
                style: TextStyle(
                    color: Global.THEME_COLOR.mainColor,
                    fontSize: Global.TODO_TITLE_SIZE),
              ),
            ),
            Divider(
              color: Global.THEME_COLOR.neglected,
              thickness: 1.0,
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                todoData.description,
                style: TextStyle(
                    color: Global.THEME_COLOR.textColor,
                    fontSize: Global.NORMAL_TEXT_SIZE),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    constraints: BoxConstraints(maxWidth: 50),
                    child: Text(
                      'Deadline: ' +
                          DateTime.fromMicrosecondsSinceEpoch(
                                  todoData.deadline as int)
                              .toString(),
                      style: TextStyle(
                          color: /*isNearDeadline? warn : neglected*/ Global
                              .THEME_COLOR.neglected),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: SizedBox(),
                ),
                IconButton(
                  icon: Icon(
                    Icons.task_alt,
                    color: Global.THEME_COLOR.mainColor,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete_forever,
                    color: Global.THEME_COLOR.warnColor,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.alarm_rounded,
                    color: Global.THEME_COLOR.textColor,
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, '/planttree_page'),
                ),
              ],
            ),
          ],
        ),
        // constraints: BoxConstraints.loose(Size(300, 150)),
        constraints:
            BoxConstraints(minWidth: 300, maxWidth: 300, minHeight: 150),
        alignment: Alignment.topCenter,
        // color: Colors.grey[200],
        padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Global.THEME_COLOR.subColor,
          boxShadow: <BoxShadow>[
            BoxShadow(blurRadius: 2.0, color: Global.THEME_COLOR.neglected),
          ],
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          // border: Border(
          //     bottom: BorderSide(
          //         color: Global.THEME_COLOR.neglected,
          //         width: 2.0,
          //         style: BorderStyle.solid),
          //     right: BorderSide(
          //         color: Global.THEME_COLOR.neglected,
          //         width: 2.0,
          //         style: BorderStyle.solid)),
        ),
      ),
    );
  }
}
