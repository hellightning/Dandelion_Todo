import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('设置事项'),
            subtitle: Text('设置说明'),
          ),
          ListTile(
            title: Text('test'),
            subtitle: Text('this is test subtitle'),
          ),
          ListTile(
            title: Text('test'),
            subtitle: Text('this is test subtitle'),
          ),
        ],
      ),
    );
  }
}
