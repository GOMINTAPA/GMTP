import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'src/app.dart';
import 'src/screens/shared/global.dart';

void main() async {

  await GetStorage.init();

  final box = GetStorage();
  String? token = box.read('access_token');
  bool isLogin = (token != null) ? true : false;

  runApp(MyWidget(isLogin));
}

