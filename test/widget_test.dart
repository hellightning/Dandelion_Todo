// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dandelion_todo/main.dart';

class ImagePicWidget extends StatefulWidget {
  @override
  createState() => ImagePicState();
}

class ImagePicState extends State<ImagePicWidget> {
  final _targetImage = Image(
    image: NetworkImage('https://book.flutterchina.club/logo.png'),
    width: 100.0,
  );
  final _imageText = "This is an image";
  void _photoRequest() {

  }

  void _picPhotoRequest() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test pictures'),
        actions: <Widget>[
          IconButton(
              onPressed: _photoRequest,
              icon: const Icon(Icons.camera_alt)
          ),
          IconButton(
              onPressed: _picPhotoRequest,
              icon: const Icon(Icons.photo_album))
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _targetImage,
            Text(_imageText)
          ],
        ),
      ),
    );
  }
}

void main() {
  testWidgets('Pick up pictures', (WidgetTester tester)async {
    await tester.pumpWidget(
        ImagePicWidget()
    );
  });
}
