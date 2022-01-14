import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddFriendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Container(
          child: TextFormField(),
        ),
      ),
    );
  }
}
