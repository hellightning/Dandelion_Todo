import 'package:dandelion_todo/components/search_item.dart';
import 'package:dandelion_todo/components/todo_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// main page
class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // List<TodoProvider> todoList = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Icon(Icons.account_box_sharp),
            ),
            ElevatedButton(
              child: Text('Button'),
              onPressed: () => {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SearchItem(),
          ListView(
            children: [TodoItem(), TodoItem(), TodoItem()],
          )
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () => {}, child: Icon(Icons.add)),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
