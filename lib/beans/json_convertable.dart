import 'dart:convert';

// 直接用JSON.decode()解出来是动态类型，所以先定义个接口
abstract class IJsonConvertable {
  void fromJson();
  void toJson();
}
