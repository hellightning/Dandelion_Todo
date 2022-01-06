import 'package:dandelion_todo/beans/json_convertable.dart';

class Todo implements IJsonConvertable {
  Todo? parent;
  String title = '';
  String content = '';

  @override
  void fromJson() {
    // TODO: implement fromJson
  }

  @override
  void toJson() {
    // TODO: implement toJson
  }
}
