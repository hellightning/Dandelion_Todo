import 'dart:convert';
import 'dart:io';

import 'package:dandelion_todo/http/http_error.dart';
import 'package:dandelion_todo/http/rest_api.dart';
import 'package:dandelion_todo/http/rest_api_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePicWidget extends StatefulWidget {
  @override
  createState() => ImagePicState();
}

class ImagePicState extends State<ImagePicWidget> {
  var _targetImage = const Image(
    image: NetworkImage('https://book.flutterchina.club/logo.png'),
    width: 100.0,
  );
  var _imageText = "This is an image";
  final _dio = RestImpl();
  void _photoRequest() async {
    var loader = ImagePicker();
    var pic = await loader.pickImage(source: ImageSource.camera);
    if (pic == null) return;
    try {
      _dio.login(4, '114514');
      setState(() {
        _imageText = "uploading..";
      });
      await _dio.uploadAvatar(pic);
      var imageBack = await _dio.getAvatar(4);
      setState(() {
        _targetImage = Image.memory(imageBack);
      });
    } catch (e) {
      setState(() {
        _imageText = e.runtimeType.toString();
        if (e.runtimeType == LoginFailedException) {
          _imageText = (e as LoginFailedException).msg!;
        }
      });
    }
  }

  void _picPhotoRequest() async {
    var loader = ImagePicker();
    var pic = await loader.pickImage(source: ImageSource.gallery);
    if (pic == null) return;
    // setState(() {
    //   _targetImage = Image.file(File(pic!.path));
    // });
    try {
      _dio.login(4, '114514');
      setState(() {
        _imageText = "uploading..";
      });
      await _dio.uploadAvatar(pic);
      var imageBack = await _dio.getAvatar(4);
      setState(() {
        _targetImage = Image.memory(imageBack);
      });
    } catch (e) {
      setState(() {
        _imageText = e.runtimeType.toString();
        if (e.runtimeType == LoginFailedException) {
          _imageText = (e as LoginFailedException).msg!;
        }
      });
    }
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