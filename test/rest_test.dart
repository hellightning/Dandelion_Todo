import 'dart:io';
import 'dart:math';

import 'package:dandelion_todo/http/http_error.dart';
import 'package:dandelion_todo/http/rest_api_impl.dart';
import 'package:dandelion_todo/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var dio = RestImpl();
  group('Register Test', (){
    test('Register new account', ()async {
      var user = await dio.register("hhh", "114514");
      expect(user, const TypeMatcher<User>());
    });
  });
  group('login tests', (){
    test('login failed', () async{
      expect(dio.login(4, '1145141'), throwsA(const TypeMatcher<LoginFailedException>()));
    });
    test('login success', () async{
      await dio.login(4, '114514');
      expect(dio.dio.options.headers['Authorization'], isNotNull);
    });
  });
  group('Watch List API', (){
    test('Add List authorized', ()async {
      await dio.addWatchList([2,3,4]);
      var qans = await dio.findWatchList(4);
      expect(qans, containsAll([2,3,4]));
      await dio.deleteWatchList([2,3,4]);
      qans = await dio.findWatchList(4);
    });
    test('Add List Unauthorized', ()async {
      dio.dio.options.headers['Authorization'] = '114514';
      await dio.addWatchList([2,3,4]);
      var qans = await dio.findWatchList(4);
      expect(qans, containsAll([2,3,4]));
      await dio.deleteWatchList([2,3,4]);
      qans = await dio.findWatchList(4);
    });
  });
  group('Find Detail API', (){
    test('Detail authorized', ()async {
      var usr = await dio.findDetailById(4);
      expect(usr, isNotNull);
      expect(usr, const TypeMatcher<User>());
      usr = await dio.updateNickname("zgh");
      expect(usr, isNotNull);
      expect(usr!.nickName, 'zgh');
      usr = await dio.findDetailById(4);
      expect(usr, isNotNull);
      expect(usr!.nickName, 'zgh');
      usr = await dio.updatePassword('123456');
      expect(usr, isNotNull);
      expect(usr, const TypeMatcher<User>());
      dio.dio.options.headers['Authorization'] = '114514';
      await dio.login(4, '123456');
      expect(dio.dio.options.headers['Authorization'], isNot('114514'));
      await dio.updatePassword('114514');
    });
  });
}