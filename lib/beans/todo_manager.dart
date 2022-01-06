class TodoManager {
  // todo
  TodoManager._privateConstructor();

  static final TodoManager _instance = TodoManager._privateConstructor();

  static TodoManager get instance {
    return _instance;
  }

  int treePlanted = 0;
}
